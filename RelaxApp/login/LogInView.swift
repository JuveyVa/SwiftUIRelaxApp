//
//  LogInView.swift
//  RelaxApp
//
//  Created by ITIT on 06/03/25.
//

import SwiftUI

struct LogInView: View {
    @State var text: String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        VStack {
            Image("relaxlogo")
                .resizable()
                .frame(width: 100, height: 100)
            Text(LocalizedStringKey("welcome"))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundColor(Color(hex: 0x1ACCB5))
            TextField("email", text: .constant(""))
                .padding(.bottom, 25)
            ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("password", text: $text)
                            } else {
                                TextField("password", text: $text)
                            }
                        }.padding(.trailing, 32)

                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                .padding(.bottom, 20)
            Button(action: {
                print("Hola")
            }) {
                Text("Log In")
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
                Text("Don't have an account? Sign Up")
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

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

#Preview {
    LogInView()
}
