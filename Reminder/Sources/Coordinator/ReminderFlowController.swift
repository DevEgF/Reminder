import Foundation
import UIKit

class ReminderFlowController {
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }

    //MARK: - StarScreen
    func start() -> UINavigationController? {
        let starViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: starViewController)
        return navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let bottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(bottomSheet, animated: false) {
            bottomSheet.animateShow()
        }
    }
    
    func navigateToHomeScreen() {
        self.navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
