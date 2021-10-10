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
        addSubview(loginButton)
        
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
        
        _ = loginButton.anchor(
            top: passwordTextField.bottomAnchor,
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
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.backgroundColor = .orange
//        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    // specific a delegate
    weak var delegate: LoginControllerDelegate?
    
    
    @objc func handleLogin() {
        delegate?.finishLoggingIn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// Make space in the textfield
class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + 10,
            y: bounds.origin.y,
            width: bounds.width + 10,
            height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + 10,
            y: bounds.origin.y,
            width: bounds.width + 10,
            height: bounds.height)
    }
}











