//
//  DataService.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import Foundation

class AccountManager : ObservableObject {
    
    @Published var signedIn:Bool
    private var uid:String? = nil
    
    init() {
        self.signedIn = false
    }
    
    // Sign in user and create a unique ID
    func signIn() {
        self.signedIn = true
        self.uid = UUID().uuidString
    }
    
    // Return unique ID
    func getUid() -> String? {
        if(self.signedIn){
            return self.uid
        }
        else{
            return nil
        }
    }
    
    // Sign out user
    func signOut() {
        self.signedIn = false
        self.uid = nil
    }
}
