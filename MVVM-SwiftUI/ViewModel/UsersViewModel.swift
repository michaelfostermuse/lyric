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
    var accountManager = AccountManager(signedIn: false)
    @Published var users: [User] = []
    @Published var currentUser: User
    @Published var signedIn: Bool
    
    init(dataService:DataService) {
        self.dataService = dataService
        self.currentUser = User(name: "", token: "")
        signedIn = false
    }
    
    func signInUser(userName: String) {
        self.accountManager.signIn()
        self.signedIn = self.accountManager.signedIn
        self.currentUser = User(name: userName, token: self.accountManager.getUid() ?? "")
    }
    
    func isSignedIn() -> Bool {
        self.signedIn = self.accountManager.signedIn
        return self.signedIn
    }
    
    func signOut() {
        self.accountManager.signOut()
        self.signedIn = self.accountManager.signedIn
    }
        
    func getUsersList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            [weak self] in
            self?.users = self?.dataService.getUsersList() ?? []
        })
    }
}
