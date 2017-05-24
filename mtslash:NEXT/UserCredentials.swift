//
//  UserCredentialValidityChecker.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/23/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

// A class of static funcs for checking the validity of user credentials (username, password, etc.)

class UserCredentials {
    
    // Set a singleton for storing credentials of current user
    static let currentUser = UserCredentials()
    
    var username : String? = nil
    var password : String? = nil
    
    // A func for checking the validity of username
    static func checkValidityOfUsername(username : String?) -> Bool {
        
        if username == nil || username == "" {
            return false
        }
        if username!.characters.count < 3 || username!.characters.count > 15 {
            return false
        }
        return true
    }
    
    // A func for checking the validity of password
    static func checkValidityOfPassword(password: String?) -> Bool {
        
        if password == nil || password == "" {
            return false
        }
        if password!.characters.count > 20 {
            return false
        }
        
        return true
    }
}
