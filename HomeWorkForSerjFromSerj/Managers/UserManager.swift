//
//  UserManager.swift
//  HomeWorkForSerjFromSerj
//
//  Created by Serhii Rosovskyi on 25.03.2020.
//  Copyright © 2020 Serhii Rosovskyi. All rights reserved.
//

import Foundation

struct UserManager {
    
    private init() {}
    
    fileprivate enum Key: String {
        case email = "Email"
    }
    
}

extension UserManager {
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: Key.email.rawValue)
    }
    
    static func getEmail() -> String? {
        return UserDefaults.standard.value(forKey: Key.email.rawValue) as? String
    }
    
    static func saveEmail(with email: String?) {
        UserDefaults.standard.set(email, forKey: Key.email.rawValue)
    }
}
