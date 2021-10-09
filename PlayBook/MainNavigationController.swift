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
        view.backgroundColor = .red
        
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
        return true
        
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
class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}















