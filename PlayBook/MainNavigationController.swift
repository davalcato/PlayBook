//
//  MainNavigationController.swift
//  PlayBook
//
//  Created by Daval Cato on 10/9/21.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // if loggedIn do something
        if isLoggedIn() {
            // if user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController),
                    with: nil,
                    afterDelay: 0.01)
        }
    }
    // transport isLoggedIn into a func
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
        // true logic or value of user signed In 
//        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    // fix error for not in the window hierarchy
    @objc func showLoginController() {
        let loginController = LoginController()
        // present controller
        present(loginController,
                animated: true,
                completion: {
            // will do something here later
        })
    }
}
















