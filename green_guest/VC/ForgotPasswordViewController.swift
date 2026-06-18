//
//  ForgotPasswordViewCOntroller.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController{
    
    private var backIcon = UIImageView()
    private var backBtn = UIButton()
    private var backStack = UIStackView()
    
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var textStack = UIStackView()
    
    private var phoneTf = BaseTextFieldView(textFieldStyle: .phoneNum)
    private var submitBtn = BaseButton(buttonStyle: .submit)
    
    private var mainStack = UIStackView()
    
    private let router: AppRouterProtocol
    
    init(router: AppRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        setupLayout()
        setupActions()
    }
    
    private func setupUI() {
        backIcon.image = UIImage(named: "backIcon")
        backBtn.setTitle("Əvvələ qayıt", for: .normal)
//attributed title for font
        backBtn.setTitleColor(.maincolour, for: .normal)

        titleLabel.text = "Şifrəni yeniləyin"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
                
        descriptionLabel.text = "Mobil nömrənizi daxil edin və sizə şifrəni yeniləmək üçün sizə kod göndərək."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backStack)
        
    }
    
    private func setupLayout() {
        [backIcon, backBtn].forEach{backStack.addArrangedSubview($0)}
        backStack.axis = .horizontal
        
        [titleLabel, descriptionLabel].forEach{textStack.addArrangedSubview($0)}
        textStack.axis = .vertical
        textStack.spacing = 8
        
        [textStack, phoneTf, submitBtn].forEach{mainStack.addArrangedSubview($0)}
        mainStack.axis = .vertical
        mainStack.spacing = 28
        
        [mainStack].forEach{view.addSubview($0)}
        
        backIcon.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
        
//        backBtn.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
//            make.leading.equalToSuperview().inset(16)
//        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupActions() {
        backBtn.addTarget(self, action: #selector(backTapped), for: .touchUpInside
        )
    }

    @objc
    private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
