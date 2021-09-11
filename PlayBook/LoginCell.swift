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
        
//        backgroundColor = .green
        
        addSubview(logoImageView)
        
        _ = logoImageView.anchor(
            top: centerYAnchor,
            left: nil,
            bottom: nil,
            right: nil,
            topConstant: -200,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 160,
            heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}











