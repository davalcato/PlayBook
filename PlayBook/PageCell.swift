//
//  PageCell.swift
//  PlayBook
//
//  Created by Daval Cato on 8/21/21.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    // Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    // View component inside the cell
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "facebook")
        iv.clipsToBounds = true
        return iv
        
    }()
    
    func setupViews() {
        // Entire width and height of cell 
        addSubview(imageView)
        imageView.anchorToTop(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}













