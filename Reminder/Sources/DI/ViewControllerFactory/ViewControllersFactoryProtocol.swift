import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
    func makeReceiptsViewController() -> NewReceiptViewController
}
