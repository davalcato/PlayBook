//
//  LoginCell.swift
//  PlayBook
//
//  Created by Daval Cato on 9/10/21.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        
        _ = logoImageView.anchor(
            top: centerYAnchor,
            left: nil,
            bottom: nil,
            right: nil,
            topConstant: -360,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 160,
            heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(
            top: logoImageView.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            topConstant: 8,
            leftConstant: 32,
            bottomConstant: 0,
            rightConstant: 32,
            widthConstant: 0,
            heightConstant: 50)
        
        _ = passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            topConstant: 16,
            leftConstant: 32,
            bottomConstant: 0,
            rightConstant: 32,
            widthConstant: 0,
            heightConstant: 50)
    }
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}











