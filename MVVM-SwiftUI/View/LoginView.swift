//
//  LoginView.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var accountManager:AccountManager
    var dataService:DataService
    var usersViewModel:UsersViewModel
    @State var userName: String
    
    init() {
        self.dataService = DataService()
        self.usersViewModel = UsersViewModel(dataService: dataService)
        self.userName = ""
    }
    
    var body: some View{
        NavigationView {
            VStack{
                
                if(!accountManager.signedIn){
                    TextField("Enter your name", text: $userName)
                        .padding([.leading,.trailing],30)
                        .padding([.top,.bottom],15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        
                    Button(action: {
                        self.accountManager.signIn()
                        guard let token = self.accountManager.getUid() else {
                            return
                        }
                        let user = self.dataService.getUser(name: userName, token: token)
                        self.usersViewModel.currentUser = user
                    }) {
                        Text("Login")
                            .padding([.leading,.trailing],30)
                            .padding([.top,.bottom],15)
                    }
                    .foregroundColor(.white)
                    .background(Color(.blue))
                    .cornerRadius(3)
                }
                else{
                    TokenView(usersViewModel: self.usersViewModel)
                }
            }
            .padding(30)
        }
    }
}

// MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct LogOutButton: View {
    var logOutFunction:() -> Void

    var body: some View {
        Button(action: logOutFunction , label: {
            Text("Log Out")
        })
    }
}
