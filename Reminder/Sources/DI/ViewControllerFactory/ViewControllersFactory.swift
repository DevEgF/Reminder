import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let splashViewController = SplashViewController(contentView: contentView,flowDelegate: flowDelegate)
        return splashViewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
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
