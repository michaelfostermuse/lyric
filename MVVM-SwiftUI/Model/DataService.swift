//
//  DataService.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import Foundation
import SwiftUI

class DataService {
    
    private var users = [User]()
    
    // Retrieve users list
    func getUsersList() -> [User] {
            return self.users
    }
    
    // Get user by name or create one if none found
    func getUser(name: String, token: String) -> User {
        
        // find and return existing user
        for user in users {
            if user.name == name {
                user.tokens.append(token)
                return user
            }
        }
        // if user is not found , create a new one
        // and add it to our users array
        let newUser = User(name: name, token: token)
        self.users.append(newUser)
        
        return newUser
    }
}
