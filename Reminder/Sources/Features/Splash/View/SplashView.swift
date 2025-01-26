import Foundation
import UIKit

class SplashView: UIView {
    
    // MARK: Components
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .logo)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Init UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup View
    private func setupUI() {
        self.addSubview(logoImageView)
        
        setupConstraints()
    }
    
    // MARK: ADD Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.medium)
        ])
    }
}
