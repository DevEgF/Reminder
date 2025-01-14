import Foundation
import UIKit

protocol LoginBottonSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
