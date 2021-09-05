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
       
        cv.backgroundColor = .white
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
        let firstPage = Page(
            title: "Share all your favorite books with friends",
            message: "Be a friend and send a book! Because now for a limited time all new books are free.",
            imageName: "facebook")
        
        let secondPage = Page(
            title: "Send from your library",
            message: "Tap the more menu next to any book. Choose \"Send this Book\"",
            imageName: "page2")
        
        let thirdPage = Page(
            title: "Send from the player",
            message: "Tap the more menu next to any book. Choose \"Send this Book\"",
            imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    // Structure pageControler
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.backgroundColor = .systemBlue
        pc.currentPageIndicatorTintColor = UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1)
        pc.numberOfPages = 3
        return pc
    }()
    
    // Add the skip button
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        // Display button
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1), for: .normal)
        return button
        
    }()
    
    // Add the next button
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        // Display button
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1), for: .normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        
        _ = pageControl.anchor(top: nil,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
            heightConstant: 70)
        
        // Skip button
        _ = skipButton.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: nil,
                          topConstant: 26,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: 90,
                          heightConstant: 80)
        
        _ = nextButton.anchor(top: view.topAnchor,
                          left: nil,
                          bottom: nil,
                              right: view.rightAnchor,
                          topConstant: 26,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: 90,
                          heightConstant: 80)
        
        // Use autolayout instead to fix issue of view.frame
        collectionView.anchorToTop(
            view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor)
        
        // Register identifier with collectionView
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    // Puts the pageControl dots on screen
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view.isKind(of:UIScrollView.self) {
                view.frame = UIScreen.main.bounds
            } else if view.isKind(of:UIPageControl.self) {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    // Make cell blocks bigger
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

//extension UIPageViewController {
//
//    var scrollView: UIScrollView? {
//
//        return view.subviews.filter { $0 is UIScrollView }.first as? UIScrollView
//    }
//}




    
