import Foundation
import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    //MARK: - init
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
          self.navigationController?.dismiss(animated: false)
          let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
          self.navigationController?.pushViewController(viewController, animated: true)
      }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: false)
            let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {
    func logout() {
        self.navigationController?.popViewController(animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.openLoginBottomSheet()
        }
    }

    func navigateToRecipes() {
        let recipesViewController = viewControllerFactory.makeReceiptsViewController()
        self.navigationController?.pushViewController(recipesViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
}
