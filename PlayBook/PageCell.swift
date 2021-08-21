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
    
    func setupViews() {
        backgroundColor = .blue
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}













