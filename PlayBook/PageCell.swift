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
            
            // Change color text
            let color = UIColor(white: 0.2, alpha: 1)
            
            // Added attributed string for text
            let attributedText = NSMutableAttributedString(
                string: page.title,
                attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.center
            
            let length = attributedText.string.count
            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText

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
        tv.contentInset = UIEdgeInsets(
            top: 24,
            left: 0,
            bottom: 0,
            right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
        
    }()
    
    func setupViews() {
        // Entire width and height of cell 
        addSubview(imageView)
        // Add text reference
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageView.anchorToTop(
            topAnchor,
            left: leftAnchor,
            bottom: textView.topAnchor,
            right: rightAnchor)
        
        textView.anchorWithConstantsToTop(
            nil,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            topConstant: 0,
            leftConstant: 16,
            bottomConstant: 0,
            rightConstant: 16)
        
        // Height Anchor
        textView.heightAnchor.constraint(
            equalTo: heightAnchor,
            multiplier: 0.3).isActive = true
        
        lineSeparatorView.anchorToTop(
            nil,
            left: leftAnchor,
            bottom: textView.topAnchor,
            right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}













