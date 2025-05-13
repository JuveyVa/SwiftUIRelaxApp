import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginMessage: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isValid: Bool = false
    @Published var showAlert: Bool = false  // Para mostrar la alerta en la vista
    
    private let apiService = APIService()

    func login() {
        apiService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let response):
                    self.loginMessage = response.message ?? ""
                    print("✅ Login exitoso, Token: \(response.token)")
                    print("📄 Respuesta completa: \(response)")
                    
                    // Verificamos si el mensaje de éxito es el esperado
                    if (response.token == nil) {
                         // Ocultar la alerta si el login es exitoso
                        self.isValid = false
                        self.showAlert = true
                        self.loginMessage = "Credenciales incorrectas"
                    } else {
                        // Si el mensaje no es el esperado, es un caso de error
                        self.isValid = true
                        self.isLoggedIn = true
                        self.showAlert = false
                    }
                case .failure(let error):
                    // Si ocurre un error, mostramos un mensaje de error apropiado
                    self.isValid = false
                    self.isLoggedIn = false
                    self.showAlert = true  // Mostrar alerta en caso de error
                    self.loginMessage = "Error: \(error.localizedDescription)"
                    
                    print("❌ Error en login: \(error.localizedDescription)")
                }
            }
        }
    }
}
