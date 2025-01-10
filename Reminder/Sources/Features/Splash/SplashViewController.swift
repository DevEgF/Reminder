import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupGesture()
    }
    
    private func setup () {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        setupConstrainsts()
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let bottomSheet = LoginBottomSheetViewController()
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        self.present(bottomSheet, animated: false) {
            bottomSheet.animateShow()
        }
    }
}
