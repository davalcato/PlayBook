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
    let loginCellId = "loginCellId"
    
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
    // Structure pageControler - Lazy var makes self accessible
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.backgroundColor = .systemBlue
        pc.currentPageIndicatorTintColor = UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1)
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    // Add the skip button
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        // Display button
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1), for: .normal)
        // Add target
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return button
    }()
    
    @objc func skip() {
        pageControl.currentPage = pages.count - 1
        nextPage()
    }
    
    // Add the next button
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        // Display button
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(
            red: 247/255,
            green: 154/255,
            blue: 154/255,
            alpha: 1), for: .normal)
        // Tap button to move
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    @objc func nextPage() {
        // Fix scrolling out of the last page
        if pageControl.currentPage == pages.count {
            return
        }
        // When on the second to last page enable scroll over for next button
        if pageControl.currentPage == pages.count - 1 {
            moveControlConstraintsOffScreen()
           
            // Enable animation of skip and next button
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 1,
                options: .curveEaseOut,
                animations: {
                // Method that animates a constraint change with components
                self.view.layoutIfNeeded()
            },
                completion: nil)
            
        }
        
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        self.collectionView.isPagingEnabled = false
        self.collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        self.collectionView.isPagingEnabled = true
        pageControl.currentPage += 1
        
        // This method is broken on iOS 15
//        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
//        collectionView.scrollToItem(
//            at: indexPath,
//            at: .centeredHorizontally,
//            animated: true)
        
    }
    
    // Animate the dots downward with reference
    var pageControlBottomAnchor: NSLayoutConstraint?
    // Animate the skipbutton offscreen
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeKeyBoardNotifications()
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        
        pageControlBottomAnchor = pageControl.anchor(top: nil,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0,
            widthConstant: 0,
          // Bracket 1 accesses the second anchor for the dots at bottom
            heightConstant: 70)[1]
        
        // Animate the skipButtonTopAnchor by calling first
        skipButtonTopAnchor = skipButton.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: nil,
                          topConstant: 26,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: 90,
                          heightConstant: 80).first
        
        nextButtonTopAnchor = nextButton.anchor(top: view.topAnchor,
                          left: nil,
                          bottom: nil,
                          right: view.rightAnchor,
                          topConstant: 26,
                          leftConstant: 0,
                          bottomConstant: 0,
                          rightConstant: 0,
                          widthConstant: 90,
                          heightConstant: 80).first
        
        // Use autolayout instead to fix issue of view.frame
        collectionView.anchorToTop(
            view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor)
        
        // Register a blank cell for the last page
        registerCells()
    }
    
    // Make keyboard align with textfield
    fileprivate func observeKeyBoardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardHide() {
        // Animate entire frame back
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: {
            
            // Change the view frame of keyboard
            self.view.frame = CGRect(
                x: 0,
                y: 0,
                width: self.view.frame.width,
                height: self.view.frame.height)
        },
            completion: nil)
        
    }
    
    @objc func keyboardShow() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: {
            
            // Change the view frame of keyboard
            self.view.frame = CGRect(
                x: 0,
                y: -40,
                width: self.view.frame.width,
                height: self.view.frame.height)
        },
            completion: nil)
        print("keyboard show")
    }
    
    // Dismiss the keyboard when user scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    // Override a method to enable dot page transition
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // Convert with Int As the user slide the pages
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        
        // animate dots off screen on last page
        if pageNumber == pages.count {
           // Call function
            moveControlConstraintsOffScreen()
        } else {
            // Back on regular pages
            pageControlBottomAnchor?.constant = 0
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        // Enable animation of the next & skip button
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: {
            // Method that animates a constraint change with components
            self.view.layoutIfNeeded()
        },
            completion: nil)
    }
    
    // Refactor code to animate skip and next butoon with new method
    fileprivate func moveControlConstraintsOffScreen() {
        // Make the dots animate downward
        pageControlBottomAnchor?.constant = 40
        // Modifying the skipbutton when on the last page
        skipButtonTopAnchor?.constant = -40
        nextButtonTopAnchor?.constant = -40
        
    }
   
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
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
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Top of method
        if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    // Make cell blocks bigger
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        print(UIDevice.current.orientation.isLandscape)
        
        // Relayout the entire view
        collectionView.collectionViewLayout.invalidateLayout()
        // Center the view in Landscape
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        // Scroll to indexPath after rotation is going
        DispatchQueue.main.async {
            self.collectionView.isPagingEnabled = false
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.collectionView.isPagingEnabled = true
        }
    }
}








    
