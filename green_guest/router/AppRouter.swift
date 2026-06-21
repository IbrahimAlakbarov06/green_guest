//
//  Untitled.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit

class AppRouter: AppRouterProtocol {
    
    func changeRootViewController(vc :UIViewController) {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.changeRootViewController(to: vc)
            }
    }
    
    func mainTabbarController(user: User) -> UITabBarController {
        MainTabbarController(router: self, user: user)
    }

    func profileViewController(user: User) -> UIViewController {
        ProfileViewController(router: self, user: user)
    }
    
    func forgotPasswordViewController() -> UIViewController{
        ForgotPasswordViewController(router: self)
    }
    
    func registerViewController() -> UIViewController {
        RegisterViewController(router: self)
    }
    
    func loginViewController()-> UIViewController{
        LoginViewController(router: self)
    }
    
    func homeViewController() -> UIViewController{
        HomeViewController(router: self)
    }

    func searchViewController() -> UIViewController{
        SearchViewController(router: self)
    }
    
    func favoriteViewController() -> UIViewController{
        FavoriteViewController(router: self)
    }
    
    func pushVC(from first: UIViewController, to second: UIViewController) {
        first.navigationController?.pushViewController(second, animated: true)
    }
}
