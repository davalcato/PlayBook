//
//  HomeController .swift
//  PlayBook
//
//  Created by Daval Cato on 10/11/21.
//

import UIKit

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        navigationItem.title = "We're logged in"
        
        // sign out button
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .plain,
            target: self,
            action: #selector(handleSignOut))
        
        // Fake home page
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 64,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
            heightConstant: 0)
    }
    
    // handleSignOut button
    @objc func handleSignOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        // call synchronized by setting new value
        UserDefaults.standard.synchronize()
        
        // present the login mode 
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
}









