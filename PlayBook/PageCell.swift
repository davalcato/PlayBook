//
//  PageCell.swift
//  PlayBook
//
//  Created by Daval Cato on 8/21/21.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    // Access to the each page
    var page: Page? {
        didSet {
            
            // Unwraps the optional page
            guard let page = page else {
                return
            }
            //Access the page here
            imageView.image = UIImage(named: page.imageName)
            
            // Change text on each page
            textView.text = page.title + "\n\n" + page.message

        }
        
    }
    
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
    // Text view
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        return tv
    }()
    
    func setupViews() {
        // Entire width and height of cell 
        addSubview(imageView)
        // Add text reference
        addSubview(textView)
        
        imageView.anchorToTop(
            top: topAnchor,
            left: leftAnchor,
            bottom: textView.topAnchor,
            right: rightAnchor)
        
        // Placed text veiw
        textView.anchorToTop(
            top: nil,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor)
        
        // Height Anchor
        textView.heightAnchor.constraint(
            equalTo: heightAnchor,
            multiplier: 0.3).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}













