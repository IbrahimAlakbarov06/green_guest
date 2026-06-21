//
//  BaseTextField.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class BaseTextFieldView: UIView {
    var textFieldStyle: TextFieldCases
    
    var text: String? {
            return inputTf.text
        }
    
    let verticalStack = UIStackView()
    let horizontalStack = UIStackView()
    let firstLabel = UILabel()
    let inputTf = UITextField()
    
    init(textFieldStyle:TextFieldCases,_ tag: Int = -1) {
        inputTf.tag = tag
        self.textFieldStyle = textFieldStyle
        super.init(frame: .zero)
        designView()
        changeTextFieldStyle()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemente")
        
    }
    
    func changeTextFieldStyle() {
        switch textFieldStyle {
        case .phoneNum:
            numberTfDesign()
        case .email:
            emailTfDesign()
        case .password:
            passwordTfDesign()
        case .name(let label, let placeholder):
                nameTfDesign(label: label, placeholder: placeholder)
        }
    }
    
    func numberTfDesign() {
        let secondLabel = UILabel()
        firstLabel.text = "Mobil nömrəniz"
        firstLabel.textColor = .gray
        secondLabel.text = "+994 "
        secondLabel.font = UIFont(name: "DMSans-Regular", size: 16)
        secondLabel.textColor = .black
        inputTf.placeholder = "XX XXX XX XX"
        
        
        horizontalStack.addArrangedSubview(secondLabel)
        horizontalStack.addArrangedSubview(inputTf)
    }
    
    func emailTfDesign() {
        firstLabel.text = "Email"
        firstLabel.textColor = .gray
        inputTf.placeholder = "example@gmail.com"
        horizontalStack.addArrangedSubview(inputTf)
    }
    
    func passwordTfDesign() {
        firstLabel.text = "Şifrəniz"
        firstLabel.textColor = .gray
        inputTf.isSecureTextEntry = true
        inputTf.placeholder = "••••••••"
            
        let eyeBtn = UIButton()
        eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeBtn.tintColor = .gray
        eyeBtn.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
            
        horizontalStack.addArrangedSubview(inputTf)
        self.addSubview(eyeBtn)
        eyeBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(16)
        }
    }
    
    func nameTfDesign(label: String, placeholder: String) {
        firstLabel.text = label
        firstLabel.textColor = .gray
        inputTf.placeholder = placeholder
        horizontalStack.addArrangedSubview(inputTf)
    }
    
    func designView() {
        self.backgroundColor = .systemGray6
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 29

        self.addSubview(verticalStack)
        verticalStack.axis = .vertical
        horizontalStack.axis = .horizontal
        
        verticalStack.snp.makeConstraints{ make in
            make.top.bottom.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
            
        }
        
        verticalStack.addArrangedSubview(firstLabel)
        verticalStack.addArrangedSubview(horizontalStack)
        
        
        firstLabel.font = UIFont(name: "DMSans-Regular", size: 12)
        
        self.snp.makeConstraints {make in
            make.height.equalTo(58)
        }
    }
    
    @objc
    private func togglePassword() {
        inputTf.isSecureTextEntry.toggle()
        let icon = inputTf.isSecureTextEntry ? "eye.slash" : "eye"
    }
}
