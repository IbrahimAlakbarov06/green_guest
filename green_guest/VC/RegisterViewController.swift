//
//  RegisterViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 21.06.26.
//

import UIKit
import SwiftUI
import SnapKit

class RegisterViewController: UIViewController{
    
    private let languageSwitchStack = LanguageSwitchView()
    
    private let mainLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let textStack = UIStackView()
    
    private let firstNameTf = BaseTextFieldView(textFieldStyle: .name(label: "Adınız", placeholder: "Adınızı daxil edin"))
    private let lastNameTf = BaseTextFieldView(textFieldStyle: .name(label: "Soyadınız", placeholder: "Soyadınızı daxil edin"))
    private let emailTf = BaseTextFieldView(textFieldStyle: .email)
    private let phoneTf = BaseTextFieldView(textFieldStyle: .phoneNum)
    
    private let passwordTf = BaseTextFieldView(textFieldStyle: .password)
    private let passwordValidationText = UILabel()
    private let passwordWithTextStack = UIStackView()
    
    private let confirmPasswordTf = BaseTextFieldView(textFieldStyle: .password)
    private let inputStack = UIStackView()
    
    private let termsCheckBtn = UIButton()
    private let termsLabel = UILabel()
    private let termsStack = UIStackView()
    
    private let inputWithTermsStack  = UIStackView()
    
    private let registerBtn = BaseButton(buttonStyle: .main(title: "Qeydiyyatdan keçin"))
    
    private let orStack = OrView()
    
    private let googleBtn = BaseButton(buttonStyle: .google)
    private let appleBtn = BaseButton(buttonStyle: .apple)
    private let guestBtn = BaseButton(buttonStyle: .guest)
    private let socialStack = UIStackView()
    
    private let buttonStack = UIStackView()
    
    private let loginLabel = UILabel()
    private let loginBtn = UIButton()
    private let loginStack = UIStackView()
    
    private let mainStack = UIStackView()
    private let scrollView = UIScrollView()
    
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
        view.backgroundColor = .systemBackground
        setupUI()
        setupLayout()
        setupActions()
    }
    
    private func setupUI() {
        mainLabel.text = "Hesab yaradın"
        mainLabel.textColor = .black
        mainLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        descriptionLabel.text = "Bir-birindən fərqli aqroturizm fəaliyyətləri üçün qeydiyyatdan keçin!"
        descriptionLabel.textColor = .systemGray
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        
        termsLabel.text = "İstifadə şərtlərini və məxfilik siyasətini oxudum və qəbul edirəm."
        termsLabel.font = .systemFont(ofSize: 14)
        termsLabel.textColor = .black
        termsLabel.numberOfLines = 0
        
        loginLabel.text = "Hesabınız var?"
        loginLabel.textColor = .gray
        loginLabel.font = .systemFont(ofSize: 14)
        
        loginBtn.setTitle("Daxil olun", for: .normal)
        loginBtn.setTitleColor(.maincolour, for: .normal)
        loginBtn.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private func setupLayout() {
        [mainLabel, descriptionLabel].forEach{textStack.addArrangedSubview($0)}
        textStack.axis = .vertical
        textStack.spacing = 8
        
        [passwordTf, passwordValidationText].forEach{passwordWithTextStack.addArrangedSubview($0)}
        passwordWithTextStack.axis = .vertical
        passwordWithTextStack.spacing = 8
        
        [firstNameTf, lastNameTf, emailTf, phoneTf, passwordWithTextStack, confirmPasswordTf].forEach { inputStack.addArrangedSubview($0) }
        inputStack.axis = .vertical
        inputStack.spacing = 16
        
        [termsCheckBtn, termsLabel].forEach{termsStack.addArrangedSubview($0)}
        termsStack.axis = .horizontal
        termsStack.spacing = 8
        termsStack.alignment = .center
        
        [inputStack, termsStack].forEach{inputWithTermsStack.addArrangedSubview($0)}
        inputWithTermsStack.axis = .vertical
        inputWithTermsStack.spacing = 16
        
        [googleBtn, appleBtn, guestBtn].forEach{socialStack.addArrangedSubview($0)}
        socialStack.axis = .vertical
        socialStack.spacing = 8
        
        [registerBtn, orStack, socialStack].forEach{buttonStack.addArrangedSubview($0)}
        buttonStack.axis = .vertical
        buttonStack.spacing = 12
        
        [loginLabel, loginBtn].forEach{loginStack.addArrangedSubview($0)}
        loginStack.axis = .horizontal
        loginStack.spacing = 4
        loginStack.alignment = .center
        
        [textStack, inputWithTermsStack, buttonStack, loginStack].forEach{mainStack.addArrangedSubview($0)}
        mainStack.axis = .vertical
        mainStack.spacing = 28
        
        view.addSubview(languageSwitchStack)
        view.addSubview(scrollView)
        scrollView.addSubview(mainStack)
        
        languageSwitchStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalToSuperview().inset(14)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(languageSwitchStack.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide).inset(16)
            make.width.equalTo(scrollView.frameLayoutGuide).inset(16)
        }
        
        termsCheckBtn.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
    }
    
    private func setupActions() {
        loginBtn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
    }
    
    @objc
    private func didTapLoginBtn() {
        navigationController?.popViewController(animated: true)
    }
}



#Preview {
    RegisterViewController(router: AppRouter())
}
