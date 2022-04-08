//
//  TipstersViewModel.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import Foundation
import SwiftUI

protocol UsersViewModelProtocol {
    func getUsersList()
}

class UsersViewModel: UsersViewModelProtocol, ObservableObject{
    
    var dataService:DataService
    var accountManager = AccountManager()
    @Published var users: [User] = []
    @Published var currentUser: User
    @Published var signedIn: Bool
    
    init() {
        self.dataService = DataService()
        self.currentUser = User(name: "", token: "")
        signedIn = false
    }
    
    // Signin a user
    func signInUser(userName: String) {
        self.accountManager.signIn()
        self.signedIn = self.accountManager.signedIn
        let user = self.dataService.getUser(name: userName, token: self.accountManager.getUid() ?? "")
        
        self.currentUser = user
    }
    
    // Check to see if a user is signedIn by name
    func isSignedIn() -> Bool {
        self.signedIn = self.accountManager.signedIn
        return self.signedIn
    }
    
    // signout current user
    func signOut() {
        self.accountManager.signOut()
        self.signedIn = self.accountManager.signedIn
    }
        
    // Retrieve list of users
    func getUsersList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            [weak self] in
            self?.users = self?.dataService.getUsersList() ?? []
        })
    }
}
