//
//  LoginViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let azBtn = UIButton()
    private let symbolLang = UILabel()
    private let enBtn = UIButton()
    private let languageStack = UIStackView()
    
    private let isAzSelected = true
    
    private let welcomeLabel = UILabel()
    
    private let phoneTf = BaseTextFieldView(textFieldStyle: .phoneNum, 0)
    private let emailTf = BaseTextFieldView(textFieldStyle: .email, 1)
    private let passwordTf = BaseTextFieldView(textFieldStyle: .password)
    private let inputStack =  UIStackView()
    
    private let forgotPasswordBtn = UIButton()
    private let inputWithForgotStack = UIStackView()
    
    private let loginBtn = BaseButton(buttonStyle: .login)
    
    private let orLabel = UILabel()
    private let leftLine = UIView()
    private let rightLine = UIView()
    private let orStack = UIStackView()
    
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
    }

    private func setupUI() {
        azBtn.setTitle("AZ", for: .normal)
        azBtn.setTitleColor(.black, for: .normal)
        enBtn.setTitle("EN", for: .normal)
        enBtn.setTitleColor(.gray, for: .normal)
        symbolLang.text = "|"
        symbolLang.textColor = .gray
        
        welcomeLabel.text = "Xoş gəlmisiniz!"
        welcomeLabel.font = .systemFont(ofSize: 28, weight: .bold)
        welcomeLabel.textColor = .black
        
        forgotPasswordBtn.setTitle("Şifrəni unutdunuz?", for: .normal)
        forgotPasswordBtn.setTitleColor(.maincolour, for: .normal)
        forgotPasswordBtn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        forgotPasswordBtn.contentHorizontalAlignment = .right
        
        orLabel.text = "Və ya"
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 14)
        leftLine.backgroundColor = .systemGray4
        rightLine.backgroundColor = .systemGray4
        
        registerLabel.text = "Hesabınız yoxdur?"
        registerLabel.textColor = .gray
        registerLabel.font = .systemFont(ofSize: 14)

        registerBtn.setTitle("Qeydiyyatdan keçin", for: .normal)
        registerBtn.setTitleColor(.maincolour, for: .normal)
        registerBtn.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private func setupLayout() {
        [azBtn, symbolLang, enBtn].forEach {languageStack.addArrangedSubview($0)}
        languageStack.axis = .horizontal
        languageStack.spacing = 2
        
        [phoneTf, emailTf, passwordTf].forEach{inputStack.addArrangedSubview($0)}
        inputStack.axis = .vertical
        inputStack.spacing = 16
        
        [inputStack, forgotPasswordBtn].forEach{inputWithForgotStack.addArrangedSubview($0)}
        inputWithForgotStack.axis = .vertical
        inputWithForgotStack.spacing = 8
        
        [leftLine, orLabel, rightLine].forEach{orStack.addArrangedSubview($0)}
        orStack.axis = .horizontal
        orStack.spacing = 12
        orStack.alignment = .center
        
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
        
        [languageStack, mainStack, registerStack].forEach{view.addSubview($0)}
        
        languageStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalToSuperview().inset(14)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(languageStack.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(inputWithForgotStack.snp.bottom).offset(28)
        }
        
        leftLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        rightLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(leftLine)
        }
        
        registerStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupActions() {
        azBtn.tag = 0
        enBtn.tag = 1
        
        azBtn.addTarget(self, action: #selector(toggleLanguage(_ :)) , for: .touchUpInside)
        enBtn.addTarget(self, action: #selector(toggleLanguage(_ :)) , for: .touchUpInside)
        
        forgotPasswordBtn.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        loginBtn.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)

    }
    
    @objc
    private func toggleLanguage(_ sender: UIButton){
        switch sender.tag {
        case 0:
            azBtn.setTitleColor(UIColor.black, for: .normal)
            enBtn.setTitleColor(UIColor.gray, for: .normal)
        case 1:
            azBtn.setTitleColor(UIColor.gray, for: .normal)
            enBtn.setTitleColor(UIColor.black, for: .normal)
        default: return
        }
    }
    
    @objc
    private func didTapForgotPassword() {
        router.pushVC(from: self, to: router.forgotPasswordViewController())
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0 :
            phoneTf.layer.borderColor = UIColor.systemGreen.cgColor
        case 1:
            emailTf.layer.borderColor = UIColor.systemRed.cgColor
        default:
            return
        }
    }
}
