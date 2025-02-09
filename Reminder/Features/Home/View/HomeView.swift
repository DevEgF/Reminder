import Foundation
import UIKit

class HomeView: UIView {
    weak public var delegate: HomeViewDelegate?
    
    let profileBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = Metrics.medium
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "home.welcome.label".localized
        label.textColor = Colors.gray200
        label.font = Typography.input
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = Typography.heading
        textField.textColor = Colors.gray100
        textField.returnKeyType = .done
        textField.placeholder = "home.name.placeholder".localized
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let feedbackButton: UIButton = {
       let button = UIButton()
        button.setTitle("home.feedback.button.title".localized, for: .normal)
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameTextField)
        
        addSubview(contentBackground)
        contentBackground.addSubview(feedbackButton)
        setupConstraints()
        setupImageGesture()
    }
    
    private func setupImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(profileImageTapped))
    
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func profileImageTapped() {
        delegate?.didTapProfileImage()
    }
    
    private func setupTextField() {
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidEndEditing), for: .editingDidEnd)
        nameTextField.delegate = self
    }
    
    @objc
    private func nameTextFieldDidEndEditing() {
        let userName = nameTextField.text ?? ""
        UserDefaultManager.saveUserName(name: userName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: topAnchor, constant: safeAreaInsets.top),
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.veryHuge),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            contentBackground.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Metrics.huge),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
            feedbackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedbackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let userName = nameTextField.text ?? ""
        UserDefaultManager.saveUserName(name: userName)
        return true
    }
}
