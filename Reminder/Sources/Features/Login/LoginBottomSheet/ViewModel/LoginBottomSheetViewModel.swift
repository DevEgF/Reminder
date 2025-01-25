import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    
    func doAuth(userNameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: userNameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                print("autenticação não foi feita com sucesso \(error)")
            } else {
                self?.successResult?(userNameLogin)
            }
        }
    }
}
