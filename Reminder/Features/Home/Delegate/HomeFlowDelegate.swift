import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func logout()
}
