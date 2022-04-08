//
//  TipstersViewModel.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import Foundation
import SwiftUI

protocol UsersViewModelProtocol {
    func getUsersList(uid:String?)
}

class UsersViewModel: UsersViewModelProtocol, ObservableObject{
    
    var dataService:DataService
    @Published var users: [User] = []
    @Published var currentUser: User
    
    init(dataService:DataService) {
        self.dataService = dataService
        self.currentUser = User(name: "", token: "")
    }
        
    func getUsersList(uid: String?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            [weak self] in
            self?.users = self?.dataService.getUsersList() ?? []
        })
    }
}
