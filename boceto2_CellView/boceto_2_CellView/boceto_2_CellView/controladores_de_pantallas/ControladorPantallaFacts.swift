//
//  ControladorPantallaFacts.swift
//  boceto_2_CellView
//
//  Created by alumno on 11/8/24.
//

import UIKit

class ControladorPantallaFacts: UIViewController, UICollectionViewDataSource{
    private let identificador_de_celda = "CeldaComentario"
    
    let proveedor_datos = ProveedorDeDatosGato.autoreferencia
    @IBOutlet weak var titulo_de_publicacion: UILabel!
    @IBOutlet weak var nombre_de_usuario: UILabel!
    @IBOutlet weak var cuerpo_de_publicacion: UILabel!
    @IBOutlet weak var seccion_comentarios: UICollectionView!

    public var lenght_fact: Int?
    
    private var dato: CatFact?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(activar: true)
        
        
        realizar_descarga_de_informacion()
    }
    
    func realizar_descarga_de_informacion(){
        if self.dato == nil {
            proveedor_datos.obtener_publicacion(id: self.id_publicacion ?? -1, que_hacer_al_recibir: {
                [weak self] (publicacion) in self?.publicacion = publicacion
                DispatchQueue.main.async {
                    self?.dibujar_publicacion()
                    self?.realizar_descarga_de_informacion()
                }
            })
        }
        
        
        
        
    }
    
    func dibujar_publicacion(){
        guard let publicacion_actual = self.dato else {
            return
        }
        
        titulo_de_publicacion.text = "Dato curioso de los gatos"
        cuerpo_de_publicacion.text = dato?.fact
        
    }

    

    
}

