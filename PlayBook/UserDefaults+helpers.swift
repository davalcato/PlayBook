//
//  UserDefaults+helpers.swift
//  PlayBook
//
//  Created by Daval Cato on 10/11/21.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    // rawValue gives actual string from enum
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        // call synchronized by setting new value
        synchronize()
    }
    // return Bool value
    func isLoggedIn() -> Bool {
        // specify bool forkey 
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        
    }
}








