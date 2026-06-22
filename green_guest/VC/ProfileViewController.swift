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
    
    private let updateBtn = BaseButton(buttonStyle: .main(title: "Yeniləyin"))
    private let changePasswordStack = UIStackView()
        
    private let logoutBtn = UIButton()

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
        setupActions()
        showEmail()
    }
    
    private func setupUI() {
        avatarImg.image = UIImage(named: "profileAvatar")
        
        emailLabel.font = .systemFont(ofSize: 16, weight: .medium)
        emailLabel.textColor = .label
            
        editBtn.setTitle("Düzəliş edin", for: .normal)
        editBtn.setTitleColor(.black, for: .normal)
        editBtn.titleLabel?.font = .systemFont(ofSize: 14)
        editBtn.layer.borderWidth = 1
        editBtn.layer.borderColor = UIColor.systemGray4.cgColor
        editBtn.layer.cornerRadius = 18
        editBtn.setImage(UIImage(named: "editIcon"), for: .normal)
        
        changePasswordIcon.image = UIImage(named: "changePassIcon")
        changePasswordLabel.text = "Şifrənizi dəyişin"
        changePasswordLabel.textColor = .black
        changePasswordLabel.font = .systemFont(ofSize: 18)
        
        updateBtn.layer.cornerRadius = 15

        logoutBtn.setTitle("Çıxış et", for: .normal)
        logoutBtn.setTitleColor(.red, for: .normal)
        logoutBtn.setImage(UIImage(named: "logoutIcon"), for: .normal)
        logoutBtn.titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    private func setupLayout() {
        [emailLabel, editBtn].forEach{emailWithEditStack.addArrangedSubview($0)}
        emailWithEditStack.axis = .vertical
        emailWithEditStack.spacing = 8
        emailWithEditStack.alignment = .leading
        
        [avatarImg, emailWithEditStack].forEach{upStack.addArrangedSubview($0)}
        upStack.axis = .horizontal
        upStack.spacing = 12
        upStack.alignment = .center
        
        [changePasswordIcon, changePasswordLabel].forEach{iconWithTextStack.addArrangedSubview($0)}
        iconWithTextStack.axis = .horizontal
        iconWithTextStack.spacing = 12
        
        [iconWithTextStack, updateBtn].forEach{changePasswordStack.addArrangedSubview($0)}
        changePasswordStack.axis = .horizontal
        changePasswordStack.alignment = .center
        changePasswordStack.distribution = .equalSpacing
            
        [changePasswordStack, logoutBtn].forEach { downStack.addArrangedSubview($0) }
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
        
        updateBtn.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }
    
    private func setupActions() {
        logoutBtn.addTarget(self, action: #selector(didTapLogoutBtn), for: .touchUpInside)
        editBtn.addTarget(self, action: #selector(didTapEditBtn), for: .touchUpInside)
    }
    
    private func showEmail() {
        emailLabel.text = user.email
    }
    
    @objc
    private func didTapLogoutBtn() {
        router.changeRootViewController(vc: router.loginViewController())
    }
    
    @objc
    private func didTapEditBtn() {
        router.pushVC(from: self, to: router.updateProfileViewController())
    }
}
