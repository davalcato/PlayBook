//
//  UserDefaults+helpers.swift
//  PlayBook
//
//  Created by Daval Cato on 10/11/21.
//

import Foundation

extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        set(false, forKey: "isLoggedIn")
        // call synchronized by setting new value
        synchronize()
    }
    // return Bool value
    func isLoggedIn() -> Bool {
        // specify bool forkey 
        return bool(forKey: "isLoggedIn")
        
    }
}








