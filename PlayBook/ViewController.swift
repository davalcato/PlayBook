//
//  ViewController.swift
//  PlayBook
//
//  Created by Daval Cato on 8/20/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Lazy var to access self within closure block
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // scroll direction
        layout.scrollDirection = .horizontal
        // layout line spacing 
        
        let cv = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout)
        cv.backgroundColor = .red
        // Datasource from collectionView
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        
    return cv
    }()
    
    // Registering cell with identifier
    let cellId = "cellId"
    
    // Added Pages
    var pages: [Page] = {
        return []
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        // Use autolayout instead to fix issue of view.frame
        collectionView.anchorToTop(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor)
        
        // Register identifier with collectionView
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    // Make cell blocks bigger
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

extension UIView {
    
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left:
                     NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right:
                     NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right:
                                    right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(
        top: NSLayoutYAxisAnchor? = nil, left:
        NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right:
        NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0)
    {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
            
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
            
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: rightConstant).isActive = true
            
        }
    }
}
    
