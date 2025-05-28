import Foundation
import UIKit

class NewReceiptView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLable: UILabel = {
       let label = UILabel()
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "Nova Receita"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ Adicionar", for: .normal)
        button.titleLabel?.font = Typography.subheading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let remedyInput = Input(title: "Remédio", placeHolder: "Nome do medicamento")
    let timeInput = Input(title: "Horário", placeHolder: "00:00")
    let recurrenceInput = Input(title: "Recorrência", placeHolder: "Selecione")
//    let takeNowCheckbox
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backButton)
        addSubview(titleLable)
        addSubview(descriptionLabel)
        addSubview(addButton)
        addSubview(remedyInput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            titleLable.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.small),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.medium),
            remedyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            remedyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.medium),
            timeInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            timeInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            recurrenceInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.heightAnchor.constraint(equalToConstant: 56),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.high)
        ])
    }
}
