//
//  LanguageSwitchView.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 21.06.26.
//

import UIKit
import SnapKit

class LanguageSwitchView: UIView {
    
    private let azBtn = UIButton()
    private let symbolLang = UILabel()
    private let enBtn = UIButton()
    private let languageStack = UIStackView()
    
    private var isAzSelected = true
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        azBtn.setTitle("AZ", for: .normal)
        azBtn.setTitleColor(.black, for: .normal)
        azBtn.tag = 0
        
        enBtn.setTitle("EN", for: .normal)
        enBtn.setTitleColor(.gray, for: .normal)
        enBtn.tag = 1
        
        symbolLang.text = "|"
        symbolLang.textColor = .gray
    }
    
    private func setupLayout() {
        [azBtn, symbolLang, enBtn].forEach {languageStack.addArrangedSubview($0)}
        languageStack.axis = .horizontal
        languageStack.spacing = 2
        
        addSubview(languageStack)
        
        languageStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupActions() {
        azBtn.addTarget(self, action: #selector(toggleLanguage(_:)), for: .touchUpInside)
        enBtn.addTarget(self, action: #selector(toggleLanguage(_:)), for: .touchUpInside)
    }
    
    @objc
    private func toggleLanguage(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            isAzSelected = true
            azBtn.setTitleColor(.black, for: .normal)
            enBtn.setTitleColor(.gray, for: .normal)
        case 1:
            isAzSelected = false
            azBtn.setTitleColor(.gray, for: .normal)
            enBtn.setTitleColor(.black, for: .normal)
        default:
            return
        }
    }
}
