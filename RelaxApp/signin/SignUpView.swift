//
//  SignUpView.swift
//  RelaxApp
//
//  Created by ITIT on 07/04/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("welcome"))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundColor(Color(hex: 0x1ACCB5))
            TextField(LocalizedStringKey("name"), text:
                $viewModel.name)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("lastname"), text: $viewModel.lastname)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("email"), text: $viewModel.email)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("password"), text: $viewModel.password)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("phone"), text: $viewModel.phone)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("country"), text: $viewModel.country)
                .padding(.bottom, 25)
            TextField(LocalizedStringKey("rol"), text:
                $viewModel.rol)
                .padding(.bottom, 25)
            
            Button(action: {
                viewModel.signup()
            }) {
                Text("button_signup")
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 350, height: 35)
            }
            .background(Color(hex: 0x1ACCB5))
            .clipShape(Capsule())
            .padding(.top)
            
            Button(action: {
                print("Si")
            }) {
                Text(LocalizedStringKey("message_already_account"))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 350, height: 35)
                    .font(.system(size: 14))
            }
            .background(Color(.white))
            .clipShape(Capsule())
            .padding(.top, 5)
        }
        .padding()
    }
}


#Preview {
    SignUpView()
}
