//
//  ControladorPantallaPrincipalDeColeccion.swift
//  boceto_2_CellView
//
//  Created by alumno on 10/7/24.
//

import UIKit

private let identificador_de_celda = "celda_pantalla_principal"

class ControladorPantallaPrincipalDeColeccion: UICollectionViewController {
    
    private var lista_de_datos: [CatFact] = []
    private let url_de_publicaciones = "https://catfact.ninja/fact"
    
    private var identificador_de_celda = "celda_pantalla_principal"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datosGato()
    }


    func datosGato() {
            // La URL de la API
            guard let url = URL(string: "https://catfact.ninja/fact") else { return }

            // Crear una tarea de URLSession para hacer la solicitud GET
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                // Comprobar que los datos no son nulos
                guard let data = data else {
                    print("No se recibió data.")
                    return
                }

                do {
                    // Decodificar el JSON en un objeto CatFact
                    let decoder = JSONDecoder()
                    let catFact = try decoder.decode(CatFact.self, from: data)
                    
                    // Mostrar el hecho del gato (en el hilo principal)
                    DispatchQueue.main.async {
                        print("Fact: \(catFact.fact)")
                    }
                } catch {
                    print("Error al decodificar JSON: \(error)")
                }
            }

            // Iniciar la tarea
            task.resume()
    }
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.lista_de_datos.count
    }

    
    //Funcion para identificar y creartitle cada una de las celdas creadas en el Controller
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeZelda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celda, for: indexPath) as! VistaDeZelda
    
        // Configure the cell
        celda.backgroundColor = UIColor.systemPink
        
        //celda.etiqueta.text = "\(indexPath)"
        celda.etiqueta.text = self.lista_de_datos[indexPath.item].fact
        
    
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se seleccionó la celda\(indexPath)")
        
        let pantalla_de_publicacion = storyboard?.instantiateViewController(withIdentifier: "PantallaPublicacion") as! ControladorPantallaDelPost
        
        pantalla_de_publicacion.id_publicacion = self.lista_de_datos[indexPath.item].lenght
        //pantalla_de_publicacion.id_publicacion = indexPath.item
        
        self.navigationController?.pushViewController(pantalla_de_publicacion, animated: true)

    
    }
}

    
