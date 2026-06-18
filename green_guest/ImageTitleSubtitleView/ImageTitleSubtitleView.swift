//
//  ImageTitleSubtitleView.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 18.06.26.
//

import UIKit
import SnapKit

class ImageTitleSubtitleView: UIView {
    
    private let image = UIImageView()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 24, weight: .semibold)
        title.textColor = .black
        return title
    }()
    
    private let subtitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 16, weight: .regular)
        title.numberOfLines = 0
        title.textColor = .darkGray
        return title
    }()
    
    private let titleStack = UIStackView()
    private let mainStack = UIStackView()
    
    init(imageStr: UIImage, titleStr: String, subtitleStr: String ){
        super.init(frame: .zero)
        self.image.image = imageStr
        self.title.text = titleStr
        self.subtitle.text = subtitleStr
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [title, subtitle].forEach{titleStack.addArrangedSubview($0)}
        titleStack.axis = .vertical
        titleStack.spacing = 8
        titleStack.alignment = .center
        
        [image, titleStack].forEach{mainStack.addArrangedSubview($0)}
        mainStack.axis = .vertical
        mainStack.spacing = 28
        mainStack.distribution = .equalCentering
        mainStack.alignment = .center
        
        addSubview(mainStack)
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
