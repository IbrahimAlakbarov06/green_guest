//
//  FavoriteViewController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController{
    
    private let router: AppRouterProtocol
    private let 
    
    init(router: AppRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
