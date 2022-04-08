//
//  TokensView.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import SwiftUI

struct TokensView: View {
    
    @ObservedObject var usersViewModel:UsersViewModel
    @EnvironmentObject var accountManager:AccountManager
    
    var body: some View {
        ZStack{
            List{
                ForEach(usersViewModel.currentUser.tokens ?? [], id: \.self) { token in
                        Text("\(token)")
                            .padding(10)
                }
            }
        }
        .onAppear {
            UITableView.appearance().separatorColor = .clear
            self.usersViewModel.getUsersList(uid: self.accountManager.getUid())
        }
        .navigationBarTitle(Text("Tokens"))
        .navigationBarItems(trailing: LogOutButton(logOutFunction: accountManager.signOut))
    }
}

// MARK:- Preview
struct TokensView_Previews: PreviewProvider {
    static var previews: some View {
        TokensView(usersViewModel: UsersViewModel(dataService: DataService()))
    }
}
