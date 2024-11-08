//
//  ControladorPantallaDelPost.swift
//  boceto_2_CellView
//
//  Created by Jadzia Gallegos on 10/10/24.
//

import UIKit

class ControladorPantallaDelPost: UIViewController, UICollectionViewDataSource{
    private let identificador_de_celda = "CeldaComentario"
    
    let proveedor_publicaciones = ProveedorDePublicaciones.autoreferencia
    
    @IBOutlet weak var titulo_de_publicacion: UILabel!
    @IBOutlet weak var nombre_de_usuario: UILabel!
    @IBOutlet weak var cuerpo_de_publicacion: UILabel!
    @IBOutlet weak var seccion_comentarios: UICollectionView!
    public var id_publicacion: Int?
    
    private var publicacion: Post?
    private var usuario: Usuario?
    private var lista_comentarios: [Comentario] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(activar: true)
        
        seccion_comentarios.dataSource = self
        
        realizar_descarga_de_informacion()
    }
    
    func realizar_descarga_de_informacion(){
        if self.publicacion == nil {
            proveedor_publicaciones.obtener_publicacion(id: self.id_publicacion ?? -1, que_hacer_al_recibir: {
                [weak self] (publicacion) in self?.publicacion = publicacion
                DispatchQueue.main.async {
                    self?.dibujar_publicacion()
                    self?.realizar_descarga_de_informacion()
                }
            })
        }
        
        else if self.publicacion != nil {
            proveedor_publicaciones.obtener_usuario(id: publicacion!.userId, que_hacer_al_recibir: {
                [weak self] (usuario) in self?.usuario = usuario
                DispatchQueue.main.async {
                    self?.dibujar_usuario()
                }
            })
            
            proveedor_publicaciones.obtener_comentarios(id: publicacion!.id, que_hacer_al_recibir: {
                [weak self] (comentarios_descargados) in self?.lista_comentarios = comentarios_descargados
                DispatchQueue.main.async {
                    self?.seccion_comentarios.reloadData()
                }
            })
        }
        
        
        
    }
    
    func dibujar_publicacion(){
        guard let publicacion_actual = self.publicacion else {
            return
        }
        
        titulo_de_publicacion.text = publicacion_actual.title
        cuerpo_de_publicacion.text = publicacion_actual.body
        
    }
    
    func dibujar_usuario(){
        guard let usuario_actual = self.usuario else {
            return
        }
        
        nombre_de_usuario.text = usuario_actual.username
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return lista_comentarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Aqui denberia hacer algo")
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celda, for: indexPath) as! VistaDeZelda
    
        celda.tintColor = UIColor.green
        
        let comentario = lista_comentarios[indexPath.item]
        celda.autor_coment.text = comentario.name
        celda.comentario_publi.text = comentario.body
 

        return celda
    }
    
}
