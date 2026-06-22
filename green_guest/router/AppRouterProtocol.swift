//
//  AppRouterPRotofol.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 18.06.26.
//

import UIKit

protocol AppRouterProtocol {
    func changeRootViewController(vc: UIViewController)
    func mainTabbarController(user: User) -> UITabBarController
    func homeViewController() -> UIViewController
    func favoriteViewController() -> UIViewController
//    func settingsViewController() -> UIViewController
    func profileViewController(user: User) -> UIViewController
    func forgotPasswordViewController() -> UIViewController
    func searchViewController() -> UIViewController
    func loginViewController() -> UIViewController
    func pushVC(from first: UIViewController, to second: UIViewController)
    func registerViewController() -> UIViewController
    func updateProfileViewController() -> UIViewController
}
