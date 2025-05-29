import Foundation
import UIKit

class ButtonHomeViewComponent: UIView {
    
    var tapAction: (() -> Void)?
    
    private let iconView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subheading
        label.textColor = Colors.gray100
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .chevronRight))
        imageView.tintColor = Colors.gray300
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(icon: UIImage?, title: String, description: String) {
        super.init(frame: .zero)
        
        setupSelfButtonHomeViewComponent()
        
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
        
        setupGesture()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfButtonHomeViewComponent() {
        backgroundColor = Colors.gray700
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupUI() {
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(arrowImageView)
        setupContranints()
    }
    
    private func setupContranints() {
        NSLayoutConstraint.activate([
            
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.medier),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.medier),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.medier),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: Metrics.medier),
            
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medier),
            arrowImageView.widthAnchor.constraint(equalToConstant: 16),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func setupGesture() {
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tagGesture)
        self.isUserInteractionEnabled = true
        
    }
    
    @objc private func handleTap() {
        tapAction?()
    }
}
