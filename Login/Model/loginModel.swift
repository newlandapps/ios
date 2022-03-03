//
//  loginModel.swift
//  Onroad
//
//  Created by Francisco Morales on 28/02/22.
//

import Foundation

struct loginModel:Codable{
    var responseCode: Int?
    var message: String
    var data: LoginData?
    
    enum CodingKeys: String, CodingKey {
        case responseCode
        case message
        case data
    }
}

struct LoginData: Codable {
    var email: String
    var employeeName: String
    var firstLogin: Bool
    var token: String
    var userImage: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case employeeName = "employee_name"
        case firstLogin
        case token
        case userImage
    }
    
}
