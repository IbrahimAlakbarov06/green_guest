//
//  SearchViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController{
    
    private let router: AppRouterProtocol
    private let emptyView = ImageTitleSubtitleView(imageStr: .notfoundicon, titleStr: "Uyğun nəticə tapılmadı", subtitleStr: "Axtarışınıza uyğun heç bir elan tapılmadı. Fərqli açar sözlərlə yenidən cəhd edin.")
    
    init(router: AppRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(emptyView)
        
        emptyView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.center.equalToSuperview()
        }
    }
}
