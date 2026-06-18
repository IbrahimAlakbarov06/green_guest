//
//  ProfileViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController{
    
    private let avatarImg = UIImageView()
    private let emailLabel = UILabel()
    private let editBtn = UIButton()
    
    private let emailWithEditStack = UIStackView()
    
    private let changePasswordIcon = UIImageView()
    private let changePasswordLabel = UILabel()
    private let iconWithTextStack = UIStackView()
    
    private let updateBtn = BaseButton(buttonStyle: .main)
    private let changePasswordStack = UIStackView()
        
    private let logoutIcon = UIImageView()
    private let logoutLabel = UILabel()
    private let logoutStack = UIStackView()
        
    private let upStack = UIStackView()
    private let downStack = UIStackView()
    
    private let mainStack = UIStackView()
    
    private let router: AppRouterProtocol
    private let user: User
    
    init(router: AppRouterProtocol, user: User) {
        self.router = router
        self.user = user
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
        showEmail()
    }
    
    private func setupUI() {
        emailLabel.font = .systemFont(ofSize: 16, weight: .medium)
        emailLabel.textColor = .label
            
        editBtn.setTitle("Redaktə et", for: .normal)
        editBtn.setTitleColor(.systemGreen, for: .normal)
        editBtn.titleLabel?.font = .systemFont(ofSize: 14)
        
    }
    
    private func setupLayout() {
        [emailLabel, editBtn].forEach{emailWithEditStack.addArrangedSubview($0)}
        emailWithEditStack.axis = .vertical
        emailWithEditStack.spacing = 8
        
        [avatarImg, emailWithEditStack].forEach{upStack.addArrangedSubview($0)}
        upStack.axis = .horizontal
        upStack.spacing = 12
        
        [changePasswordIcon, changePasswordLabel].forEach{iconWithTextStack.addArrangedSubview($0)}
        iconWithTextStack.axis = .horizontal
        iconWithTextStack.spacing = 12
        
        [iconWithTextStack, updateBtn].forEach{changePasswordStack.addArrangedSubview($0)}
        changePasswordStack.axis = .horizontal
        changePasswordStack.spacing = 87
        
        [logoutIcon, logoutLabel].forEach { logoutStack.addArrangedSubview($0) }
        logoutStack.axis = .horizontal
        logoutStack.spacing = 8
        logoutStack.alignment = .center
            
        [changePasswordStack, logoutStack].forEach { downStack.addArrangedSubview($0) }
        downStack.axis = .vertical
        downStack.spacing = 20
            
        [upStack, downStack].forEach { mainStack.addArrangedSubview($0) }
        mainStack.axis = .vertical
        mainStack.spacing = 28
        
        view.addSubview(mainStack)
        
        mainStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        avatarImg.snp.makeConstraints { make in
            make.size.equalTo(76)
        }
        
        editBtn.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(151)
        }
    }
    
    private func showEmail() {
        emailLabel.text = user.email
    }
}
