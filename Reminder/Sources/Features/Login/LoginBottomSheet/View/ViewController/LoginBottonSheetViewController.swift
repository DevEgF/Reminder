import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    let viewModel = LoginBottomSheetViewModel()
    let contentView: LoginBottomSheetView
    var handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView, delegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heighConstraints: () = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func bindViewModel() {
        viewModel.successResult = { [weak self] userNameLogin in
            self?.presentSaveLoginAlert(email: userNameLogin)
        }
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar Acesso",
                                                message: "Deseja salvar seu acesso?",
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancel = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancel)
        self.present(alertController, animated: true)
    }
    
    private func setupGesture() {
        //
    }
    
    private func handlePanGesture() {
        //
    }

    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottonSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(userNameLogin: user, password: password)
    }
}
