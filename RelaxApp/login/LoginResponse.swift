//
//  LoginResponse.swift
//  RelaxApp
//
//  Created by ITIT on 12/03/25.
//

import Foundation

struct LoginResponse: Codable {
    var message: String?
    let token: String?
    let user: UserResponse?
}

struct UserResponse: Codable {
    let id: String?
    let name: String?
    let phone: String?
    let country: String?
    let rol: String?
}
