//
//  SceneDelegate.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 17.06.26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let router = AppRouter()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        let navVc = UINavigationController(rootViewController: LoginViewController(router: router))
        self.window?.rootViewController = navVc
        self.window?.makeKeyAndVisible()
    }
    
    func changeRootViewController(to viewController: UIViewController) {
        guard let window else { return }
        window.rootViewController = viewController
    }

   
}
