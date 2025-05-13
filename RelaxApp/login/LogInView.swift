import SwiftUI

struct LogInView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isSecured: Bool = true
    @State private var navigateToMainView: Bool = false // Variable para controlar la navegación
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("relaxlogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(LocalizedStringKey("welcome"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hex: 0x1ACCB5))
                TextField(LocalizedStringKey("email"), text: $viewModel.email)
                    .padding(.bottom, 25)
                ZStack(alignment: .trailing) {
                    Group {
                        if isSecured {
                            SecureField(LocalizedStringKey("password"), text: $viewModel.password)
                        } else {
                            TextField(LocalizedStringKey("password"), text: $viewModel.password)
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
                    // Realizar login
                    viewModel.login()
                }) {
                    Text("button_login")
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
                    Text(LocalizedStringKey("message_create_account"))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 350, height: 35)
                        .font(.system(size: 14))
                }
                .background(Color(.white))
                .clipShape(Capsule())
                .padding(.top, 5)

                // Aquí definimos el NavigationLink que se activa cuando navigateToMainView es true
                NavigationLink(
                    destination: MainView(),
                    isActive: $navigateToMainView,
                    label: { EmptyView() }
                )
            }
            .padding()
            // Observamos cambios en isValid para decidir si navegamos a MainView
            .onChange(of: viewModel.isValid) { newValue in
                if newValue {
                    navigateToMainView = true
                    viewModel.showAlert = false // Ocultar la alerta si el login fue exitoso
                } else {
                    viewModel.showAlert = true // Mostrar la alerta si las credenciales son incorrectas
                }
            }
            // Mostramos la alerta si es necesario
            .alert("Credenciales inválidas", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) {
                    viewModel.showAlert = false // Reseteamos el estado de la alerta cuando el usuario presiona OK
                }
            } message: {
                Text("Las credenciales ingresadas no son correctas. Intenta de nuevo.")
            }
        }
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
