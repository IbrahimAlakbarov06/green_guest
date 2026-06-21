//
//  OrView.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 21.06.26.
//

import UIKit
import SnapKit

class OrView: UIView{
    
    private let orLabel = UILabel()
    private let leftLine = UIView()
    private let rightLine = UIView()
    private let orStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        orLabel.text = "Və ya"
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 14)
        leftLine.backgroundColor = .systemGray4
        rightLine.backgroundColor = .systemGray4
    }
    
    private func setupLayout() {
        [leftLine, orLabel, rightLine].forEach{orStack.addArrangedSubview($0)}
        orStack.axis = .horizontal
        orStack.spacing = 12
        orStack.alignment = .center
        
        addSubview(orStack)
            orStack.snp.makeConstraints { make in   
                make.edges.equalToSuperview()
            }
        
        leftLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        rightLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(leftLine)
        }
    }
}
