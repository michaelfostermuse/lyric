//
//  LoginView.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var accountManager:AccountManager
    @State private var selection: String? = nil
    var dataService:DataService
    @StateObject var usersViewModel = UsersViewModel(dataService: DataService())
    @State var userName: String
    
    init() {
        self.dataService = DataService()
        self.userName = ""
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View{
        NavigationView {
            ZStack{
                Image("Image1")
                VStack {
                    if(!usersViewModel.signedIn){
                        TextField("Enter your name", text: $userName)
                            .padding([.leading,.trailing],30)
                            .padding([.top,.bottom],15)
                            .foregroundColor(Color.white)
                            .background(Color(red: 50/255, green: 50/255, blue: 50/255, opacity: 0.5 ))
                            .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 4)
                            )
                        
                        Button(action: {
//                            self.accountManager.signIn()
                            self.usersViewModel.signInUser(userName: userName)
//                            guard let token = self.accountManager.getUid() else {
//                                return
//                            }
//                            let user = self.dataService.getUser(name: userName, token: token)
//                            self.usersViewModel.currentUser = user
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
