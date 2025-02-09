import Foundation
import UIKit

class UserDefaultManager {
    private static let userKey = "userKey"
    private static let userName = "userName"
    private static let profileImageKey = "profileImageKey"
    
    
    /*MARK: - Save*/
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func saveUserName(name: String) {
        UserDefaults.standard.set(name, forKey: userName)
        UserDefaults.standard.synchronize()
    }
    
    static func saveProfileImage(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: profileImageKey)
        }
    }
    
    /*MARK: - Load*/
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
        }
        return nil
    }
    
    static func loadUserName() -> String? {
        return UserDefaults.standard.string(forKey: userName)
    }
    
    static func loadProfileImage() -> UIImage? {
        if let imageData = UserDefaults.standard.data(forKey: profileImageKey) {
            return UIImage(data: imageData)
        }
        return UIImage(resource: .user)
    }
    
    /*MARK: - Remove*/
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.removeObject(forKey: userName)
        UserDefaults.standard.removeObject(forKey: profileImageKey)
        UserDefaults.standard.synchronize()
    }
}
