import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    var isLoading: ((Bool) -> Void)?

    func doAuth(userNameLogin: String, password: String) {
        isLoading?(true)

        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                self?.isLoading?(false)
                
                if let error = error {
                    self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas")
                } else {
                    self?.successResult?(userNameLogin)
                }
            }
        }
    }
}
