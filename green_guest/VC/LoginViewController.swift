//
//  LoginViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let languageSwitchView = LanguageSwitchView()

    private let welcomeLabel = UILabel()
    
    private let phoneTf = BaseTextFieldView(textFieldStyle: .phoneNum, 0)
    private let emailTf = BaseTextFieldView(textFieldStyle: .email, 1)
    private let passwordTf = BaseTextFieldView(textFieldStyle: .password, 2)
    private let inputStack =  UIStackView()
    
    private let forgotPasswordBtn = UIButton()
    private let inputWithForgotStack = UIStackView()
    
    private let orStack = OrView()
    
    private let loginBtn = BaseButton(buttonStyle: .main(title: "Daxil olun"))
    
    private let googleBtn = BaseButton(buttonStyle: .google)
    private let appleBtn = BaseButton(buttonStyle: .apple)
    private let guestBtn = BaseButton(buttonStyle: .guest)
    private let socialStack = UIStackView()
    
    private let buttonStack = UIStackView()
    
    private let mainStack = UIStackView()
    
    private let registerLabel = UILabel()
    private let registerBtn = UIButton()
    private let registerStack = UIStackView()
    
    private let router: AppRouterProtocol
    
    init(router: AppRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupLayout()
        setupActions()
        delegateTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func delegateTextField() {
        phoneTf.inputTf.delegate = self
        emailTf.inputTf.delegate = self
        passwordTf.inputTf.delegate = self
    }

    private func setupUI() {
        welcomeLabel.text = "Xoş gəlmisiniz!"
        welcomeLabel.font = .systemFont(ofSize: 28, weight: .bold)
        welcomeLabel.textColor = .black
        
        forgotPasswordBtn.setTitle("Şifrəni unutdunuz?", for: .normal)
        forgotPasswordBtn.setTitleColor(.maincolour, for: .normal)
        forgotPasswordBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        forgotPasswordBtn.contentHorizontalAlignment = .right
        
        registerLabel.text = "Hesabınız yoxdur?"
        registerLabel.textColor = .gray
        registerLabel.font = .systemFont(ofSize: 14)

        registerBtn.setTitle("Qeydiyyatdan keçin", for: .normal)
        registerBtn.setTitleColor(.maincolour, for: .normal)
        registerBtn.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private func setupLayout() {
        [phoneTf, emailTf, passwordTf].forEach{inputStack.addArrangedSubview($0)}
        inputStack.axis = .vertical
        inputStack.spacing = 16
        
        [inputStack, forgotPasswordBtn].forEach{inputWithForgotStack.addArrangedSubview($0)}
        inputWithForgotStack.axis = .vertical
        inputWithForgotStack.spacing = 8
        
        [googleBtn, appleBtn, guestBtn].forEach{socialStack.addArrangedSubview($0)}
        socialStack.axis = .vertical
        socialStack.spacing = 8
        
        [loginBtn, orStack, socialStack].forEach{buttonStack.addArrangedSubview($0)}
        buttonStack.axis = .vertical
        buttonStack.spacing = 12
        
        [welcomeLabel, inputWithForgotStack, buttonStack].forEach{mainStack.addArrangedSubview($0)}
        mainStack.axis = .vertical
        mainStack.spacing = 28
        
        [registerLabel, registerBtn].forEach{registerStack.addArrangedSubview($0)}
        registerStack.axis = .horizontal
        registerStack.spacing = 4
        registerStack.alignment = .center
        
        [languageSwitchView, mainStack, registerStack].forEach{view.addSubview($0)}
        
        languageSwitchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalToSuperview().inset(14)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(languageSwitchView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(inputWithForgotStack.snp.bottom).offset(28)
        }
        
        registerStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupActions() {
        forgotPasswordBtn.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        loginBtn.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

        registerBtn.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
    }
    
    @objc
    private func didTapForgotPassword() {
        router.pushVC(from: self, to: router.forgotPasswordViewController())
    }
    
    @objc
    private func didTapRegister() {
        let vc = RegisterViewController(router: router)
          vc.delegate = self
          router.pushVC(from: self, to: vc)
    }
    
    
    @objc
    private func didTapLoginButton() {
        guard let phone = phoneTf.text, !phone.isEmpty,
              let email = emailTf.text, !email.isEmpty,
              let password = passwordTf.text, !password.isEmpty
        else { return }
        
        let user = User(phone: phone, email: email, password: password)
        router.changeRootViewController(vc: router.mainTabbarController(user: user))  
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text ?? ""
        
        switch textField.tag {
        case 0: phoneTf.setValidLogin(Validator.isValidPhone(text))
        case 1: emailTf.setValidLogin(Validator.isValidEmail(text))
        case 2: passwordTf.setValidLogin(Validator.isValidPassword(text))
        default: break
        }
    }
}

extension LoginViewController: RegisterDelegate {
    func didRegister(user: User) {
        emailTf.inputTf.text = user.email
    }
}
