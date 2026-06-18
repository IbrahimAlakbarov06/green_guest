import UIKit
import SnapKit

class BaseButton: UIButton {
    
    var buttonStyle: ButtonCases
    
    init(buttonStyle: ButtonCases) {
        self.buttonStyle = buttonStyle
        super.init(frame: .zero)
        setupStyle()
        designStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        switch buttonStyle {
        case .login:
            loginStyle()
        case .google:
            googleStyle()
        case .apple:
            appleStyle()
        case .guest:
            guestStyle()
        case .submit:
            submitStyle()
        case .main:
            mainStyle()
        }

    }
    
    private func loginStyle() {
        self.setTitle("Daxil olun", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .maincolour
    }
    
    private func mainStyle() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .maincolour
    }
    
    private func googleStyle() {
        self.setTitle("Google ilə davam edin", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setImage(UIImage(named: "google"), for: .normal)
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.layer.borderWidth = 1
        
    }
    
    private func appleStyle() {
        self.setTitle("Apple ilə davam edin", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.layer.borderWidth = 1
    }
    
    private func guestStyle() {
        self.setTitle("Qonaq olaraq davam edin", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.layer.borderWidth = 1
    }
    
    private func submitStyle() {
        self.setTitle("Davam edin", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .maincolour
    }
    
    private func designStyle() {
        self.layer.cornerRadius = 28
        
        self.snp.makeConstraints {make in
            make.height.equalTo(56)
        }
        
    }
}
