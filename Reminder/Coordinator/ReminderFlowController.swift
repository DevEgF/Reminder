import Foundation
import UIKit

class ReminderFlowController {
    private var navigationController: UINavigationController?
    
    public init() {
    }

    //MARK: - StarScreen
    func start() -> UINavigationController? {
        let starViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: starViewController)
        return navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let bottomSheet = LoginBottomSheetViewController(delegate: self)
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(bottomSheet, animated: false) {
            bottomSheet.animateShow()
        }
    }
}
