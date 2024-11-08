//
//  proveedor_datos_gato.swift
//  boceto_2_CellView
//
//  Created by alumno on 11/8/24.
//

import Foundation
import UIKit

class ProveedorDeDatosGato{
    let url_de_publicaciones = "https://catfact.ninja/fact"
    var  lista_de_datos: [CatFact] = []
    
    
    static var autoreferencia = ProveedorDeDatosGato()
    
    private init() {}
    
    func obtener_datos(que_hacer_al_recibir: @escaping ([CatFact]) -> Void) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: "\(url_de_publicaciones)")!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {
                if let publicaciones_recibidas = datos{
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([CatFact].self, from: publicaciones_recibidas)
                    
                    self.lista_de_datos = prueba_de_interpretacion_de_datos
                    que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                }
                else {
                    print(respuesta)
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func obtener_dato(id: Int, que_hacer_al_recibir: @escaping (CatFact) -> Void) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: "\(url_de_publicaciones)")!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {
                if let publicaciones_recibidas = datos{
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(CatFact.self, from: publicaciones_recibidas)
                    
                   
                    que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                }
                else {
                    print(respuesta)
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    
    
    func realizar_subida_de_publicacion(publicacion_nueva: CatFact) {
        // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: url_de_publicaciones)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {}
        }.resume()
    }
}
