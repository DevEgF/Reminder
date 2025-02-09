import Foundation
import UIKit

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottonSheetViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "label.title".localized
        label.font = Typography.subheading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextFielLabel: UILabel = {
        let label = UILabel()
        label.text = "login.loginText.label.title".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextFielLabel: UILabel = {
        let label = UILabel()
        label.text = "login.passwordText.label.title".localized
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.tintColor = .white
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.titleLabel?.font = Typography.subheading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(loginTextFielLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFielLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        loginButton.addSubview(activityIndicator)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginTextFielLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            loginTextFielLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: loginTextFielLabel.bottomAnchor, constant: Metrics.little),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFielLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.huge),
            passwordTextFielLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFielLabel.bottomAnchor, constant: Metrics.little),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            activityIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor)
        ])
    }
    
    @objc
    private func loginButtonDidTapped() {
        let password = passwordTextField.text ?? ""
        guard let user = emailTextField.text else { return }
        delegate?.sendLoginData(user: user, password: password)
    }
    
    public func setLoading(_ isLoading: Bool) {
        if isLoading {
            loginButton.setTitle("", for: .normal)
            activityIndicator.startAnimating()
            loginButton.isUserInteractionEnabled = false
        } else {
            loginButton.setTitle("button.title".localized, for: .normal)
            activityIndicator.stopAnimating()
            loginButton.isUserInteractionEnabled = true
        }
    }
}
