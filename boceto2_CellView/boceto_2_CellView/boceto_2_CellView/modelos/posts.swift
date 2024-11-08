//
//  posts.swift
//  boceto_2_CellView
//
//  Created by alumno on 10/9/24.
//

struct Post: Codable{
    //Decodable decodificar el json par conertir el objeto (convertir informacion json a un modelo de swift)
    //Encodable generar el objeto para mandarlo al servidor y que lo atrape (permite convertir un modelo de swift a json)
    //Codable Hace ambas al mimso tiempo
    
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
