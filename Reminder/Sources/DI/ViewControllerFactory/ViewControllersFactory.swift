import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeReceiptsViewController() -> NewReceiptViewController {
        let viewController = NewReceiptViewController()
        return viewController
    }
    
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let splashViewController = SplashViewController(contentView: contentView,flowDelegate: flowDelegate)
        return splashViewController
    }
    
    func makeLoginBottomSheetController(flowDelegate: any LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let loginViewController = LoginBottomSheetViewController(contentView: contentView, delegate: flowDelegate)
        return loginViewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let homeViewController = HomeViewController(contentView: contentView, flowDelegate: flowDelegate)
        
        return homeViewController
    }
}
