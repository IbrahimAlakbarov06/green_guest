//
//  UpdateProfileViewControler.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 22.06.26.
//

import UIKit
import SnapKit

protocol UpdateProfileDelegate: AnyObject{
    func didUpdateProfile(user: User)
}

class UpdateProfileViewController: UIViewController {
    
    private let emailTf = BaseTextFieldView(textFieldStyle: .email, 1)
    private let phoneTf = BaseTextFieldView(textFieldStyle: .phoneNum, 0)
    private let inputStack = UIStackView()
    
    private let textLabel = UILabel()
    private let inputWithTextStack = UIStackView()
    
    private let cancelBtn = BaseButton(buttonStyle: .cancel)
    private let submitBtn = BaseButton(buttonStyle: .main(title: "Yadda saxlayin"))
    private let buttonStack = UIStackView()
    
    private let mainStack = UIStackView()
    
    private let router: AppRouterProtocol
    private var user: User
    weak var delegate: UpdateProfileDelegate?
    
    init(router: AppRouterProtocol, user: User) {
        self.router = router
        self.user = user
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profili redaktə"
        setupUI()
        setupLayout()
        setupActions()
        delegateTextField()
    }
    
    private func delegateTextField() {
        phoneTf.inputTf.delegate = self
        emailTf.inputTf.delegate = self
    }
    
    private func setupUI() {
        textLabel.text = "Mobil nömrənizi dəyişmək üçün bizimlə əlaqə saxlayın."
        textLabel.textColor = .gray
        textLabel.font = .italicSystemFont(ofSize: 14)
        textLabel.numberOfLines = 0
    }
    
    private func setupLayout() {
        [emailTf, phoneTf].forEach{inputStack.addArrangedSubview($0)}
        inputStack.axis = .vertical
        inputStack.spacing = 12
        
        [inputStack, textLabel].forEach{inputWithTextStack.addArrangedSubview($0)}
        inputWithTextStack.axis = .vertical
        inputWithTextStack.spacing = 8
        
        [cancelBtn, submitBtn].forEach{buttonStack.addArrangedSubview($0)}
        buttonStack.axis = .horizontal
        buttonStack.spacing = 8
        buttonStack.distribution = .fillEqually
        
        [inputWithTextStack, buttonStack].forEach{mainStack.addArrangedSubview($0)}
        mainStack.axis = .vertical
        mainStack.spacing = 28
        
        view.addSubview(mainStack)
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupActions() {
        cancelBtn.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        submitBtn.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
    }
    
    @objc
    private func didTapCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func didTapSubmit() {
        guard let email = emailTf.text, !email.isEmpty,
              let phone = phoneTf.text, !phone.isEmpty
        else { return }
        
        var updatedUser = user
        updatedUser.email = email
        updatedUser.phone = phone
        
        delegate?.didUpdateProfile(user: updatedUser)
        navigationController?.popViewController(animated: true)
    }
}

extension UpdateProfileViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text ?? ""
        
        switch textField.tag {
        case 0: phoneTf.setValidLogin(Validator.isValidPhone(text))
        case 1: emailTf.setValidLogin(Validator.isValidEmail(text))
        default: break
        }
    }
}
