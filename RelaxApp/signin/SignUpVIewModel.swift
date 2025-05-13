//
//  SignUpVIewModel.swift
//  RelaxApp
//
//  Created by ITIT on 07/04/25.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var lastname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var phone: String = ""
    @Published var country: String = ""
    @Published var rol: String = ""
    @Published var signupMessage: String = ""

    private let apiService = APIService()

    func signup() {
        apiService.signup(name: name, lastname: lastname, email: email, password: password, phone: phone, country: country, rol: rol) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let response):
                    print("📄 Respuesta completa: \(response)")
                case .failure(let error):
                    self.signupMessage = "Error: \(error.localizedDescription)"
                    print("❌ Error en login: \(error.localizedDescription)")
                }
            }
        }
    }
}

