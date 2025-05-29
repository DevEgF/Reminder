import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    let viewModel: HomeViewModel
    
    init(
        contentView: HomeView,
        flowDelegate: HomeFlowDelegate
    ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        self.viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupActionForNewRecipe()
        setupNavigationBar()
        checkForExistingData()
    }
    
    private func checkForExistingData() {
        if let user = UserDefaultManager.loadUser() {
            contentView.nameTextField.text = UserDefaultManager.loadUserName()
        }
        if let savedImage = UserDefaultManager.loadProfileImage() {
            contentView.profileImage.image = savedImage
        }
    }

    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        contentView.delegate = self
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
    
    private func setupActionForNewRecipe() {
        contentView.newPrescriptionButton.tapAction = { [weak self] in
            self?.didTapNewPrescriptionButton()
        }
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        selectProfileImage()
    }
    
    func didTapNewPrescriptionButton() {
        flowDelegate.navigateToRecipes()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImage.image = editedImage
            UserDefaultManager.saveProfileImage(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImage.image = originalImage
            UserDefaultManager.saveProfileImage(image: originalImage)
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
