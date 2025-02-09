import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    
    init(
        contentView: HomeView,
        flowDelegate: HomeFlowDelegate
    ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }

    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        buildHierarchy()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        
        let logoutButton = UIButton(type: .system)
        logoutButton.setImage(.logOutIcon, for: .normal)
        logoutButton.tintColor = Colors.primaryRedBase
        logoutButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: logoutButton)
        navigationItem.rightBarButtonItem = barButton
    }

    
    @objc
    private func logoutAction() {
        UserDefaultManager.removeUser()
        self.flowDelegate.logout()
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}
