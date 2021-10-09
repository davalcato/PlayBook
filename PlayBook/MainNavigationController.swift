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
        
        // loging here
        let isLoggedIn = false
        // if loggedIn do something
        if isLoggedIn {
            // if user is logged in
        } else {
            perform(#selector(showLoginController),
                    with: nil,
                    afterDelay: 0.01)
        }
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















