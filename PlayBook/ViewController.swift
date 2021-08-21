//
//  ViewController.swift
//  PlayBook
//
//  Created by Daval Cato on 8/20/21.
//

import UIKit

class ViewController: UIViewController {
    // Add collectionview inside viewController
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout)
        cv.backgroundColor = .red
    return cv
    
}()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.frame = view.frame
    }

}

