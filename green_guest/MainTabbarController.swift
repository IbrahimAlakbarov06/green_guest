//
//  MainTabbarController.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit

final class MainTabbarController: UITabBarController{
    
    private let router: AppRouter
    private let user: User
    
    init(router: AppRouter, user: User) {
        self.router = router
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarViewControllers()
    }
    

    private func createTabBarViewControllers() {
          
        viewControllers = [
            makeNavController(with: router.homeViewController(), and: "Home", and: "house"),
            makeNavController(with: router.searchViewController(), and: "Search", and: "magnifyingglass"),
            makeNavController(with: router.favoriteViewController(), and: "Favorites", and: "heart.fill"),
            makeNavController(with: router.profileViewController(user: user), and: "Profile", and: "person")
        ]
    }
    
    private func makeNavController(with vc: UIViewController,and title: String, and iconName: String) ->UINavigationController {
        let vc = vc
        vc.title = title
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: iconName)
        return UINavigationController(rootViewController: vc)
    }
    
}
