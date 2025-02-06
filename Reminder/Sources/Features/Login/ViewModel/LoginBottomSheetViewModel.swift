import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?("Error ao realizar login, verifique as credenciais digitadas")
            } else {
                self?.successResult?(userNameLogin)
            }
        }
    }
}
