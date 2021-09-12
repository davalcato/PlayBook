//
//  Extensions.swift
//  PlayBook
//
//  Created by Daval Cato on 8/29/21.
//

import UIKit

extension UIView {
    
    func anchorToTop(_ top: NSLayoutYAxisAnchor? = nil, left:
                     NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right:
                     NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(
            top,
            left: left,
            bottom: bottom,
            right: right,
            topConstant: 0,
            leftConstant: 0,
            bottomConstant: 0,
            rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(_
        top: NSLayoutYAxisAnchor? = nil, left:
        NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0) {
        
        
        _ = anchor(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            topConstant: topConstant,
            leftConstant: leftConstant,
            bottomConstant: bottomConstant,
            rightConstant: rightConstant)
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
    
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
            
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
}


//extension UIView {
//    
//    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        if let top = top {
//            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
//        }
//        
//        if let left = left {
//            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
//        }
//        
//        if let bottom = bottom {
//            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
//        }
//        
//        if let right = right {
//            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
//        }
//        
//        if width != 0 {
//            widthAnchor.constraint(equalToConstant: width).isActive = true
//        }
//        
//        if height != 0 {
//            heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
//    }
//    
//    func textContainerView(view: UIView, _ image: UIImage, _ textField: UITextField) -> UIView {
//        view.backgroundColor = .clear
//        
//        let imageView = UIImageView()
//        imageView.image = image
//        imageView.alpha = 0.87
//        view.addSubview(imageView)
//        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
//        view.addSubview(textField)
//        textField.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
//        textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
//        
//        let separatorView = UIView()
//        separatorView.backgroundColor = UIColor(white: 1, alpha: 0.87)
//        view.addSubview(separatorView)
//        separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.75)
//        
//        return view
//    }
//    
//}
//
//extension UIColor {
//    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
//        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
//    }
//    
//    static func mainBlue() -> UIColor {
//        return UIColor.rgb(red: 0, green: 150, blue: 255)
//    }
//    
//    static func googleRed() -> UIColor {
//        return UIColor.rgb(red: 220, green: 78, blue: 65)
//    }
//}
//
//extension UITextField {
//    func textField(withPlaceolder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
//        let tf = UITextField()
//        tf.borderStyle = .none
//        tf.font = UIFont.systemFont(ofSize: 16)
//        tf.textColor = .white
//        tf.isSecureTextEntry = isSecureTextEntry
//        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        return tf
//    }
//}
//
//
//extension UIView {
//    func addConstraintsWithFormat(format: String, views: UIView...) {
//        var viewsDictionary = [String: UIView]()
//        for (index, view) in views.enumerated() {
//            let key = "v\(index)"
//            view.translatesAutoresizingMaskIntoConstraints = false
//            viewsDictionary[key] = view
//            
//        }
//        
//        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
//    }
//}
//
//let imageCache = NSCache<AnyObject, AnyObject>()
//
//class CustomImageView: UIImageView {
//    
//    var imageUrlString: String?
//    
//    
//    func loadImageUsingUrlString(urlString: String) {
//        
//        imageUrlString = urlString
//        
//        let url = NSURL(string: urlString)
//        
//        image = nil
//        
//        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            
//            self.image = imageFromCache
//            return
//            
//            
//        }
//        
//        URLSession.shared.dataTask(with: url! as URL) { (data, respones, error) in
//            
//            if error != nil {
//                print(error!)
//                return
//            }
//            
//            DispatchQueue.main.async {
//                
//                let imageToCache = UIImage(data: data!)
//                
//                if self.imageUrlString == urlString {
//                    self.image = imageToCache
//                    
//                }
//                
//                
//                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
//                
//            }
//            
//            }.resume()
//    }
//    
//}






























