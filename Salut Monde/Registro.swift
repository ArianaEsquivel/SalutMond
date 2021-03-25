//
//  Registro.swift
//  Salut Monde
//
//  Created by Ariana Esquivel on 25/03/21.
//

import UIKit

class Registro: Codable {
    var first_name:String!
    var last_name:String!
    var second_last_name:String!
    var username:String!
    var email:String!
    var password:String!
    static var nombre:String!
    static var appa:String!
    static var apma:String!
    
    init(first_name:String, last_name:String, second_last_name:String, username:String, email:String, password:String) {
        self.first_name = first_name
        self.last_name = last_name
        self.second_last_name = second_last_name
        self.username = username
        self.email = email
        self.password = password
    }
}
