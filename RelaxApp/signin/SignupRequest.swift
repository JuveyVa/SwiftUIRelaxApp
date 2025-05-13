//
//  SignupRepository.swift
//  RelaxApp
//
//  Created by ITIT on 07/04/25.
//

struct SignupRequest: Codable {
    let name: String
    let lastname: String
    let email: String
    let password: String
    let phone: String
    let country: String
    let rol: String
}
