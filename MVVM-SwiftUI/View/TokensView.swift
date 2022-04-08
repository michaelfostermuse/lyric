//
//  TokensView.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import SwiftUI

struct TokensView: View {
    
    @ObservedObject var usersViewModel:UsersViewModel
    
    var body: some View {
            VStack {
            List{
                ForEach(usersViewModel.currentUser.tokens ?? [], id: \.self) { token in
                        Text("\(token)")
                            .padding(10)
                }
            }
        }
        .onAppear {
            UITableView.appearance().separatorColor = .clear
            self.usersViewModel.getUsersList()
        }
        .navigationBarTitle(Text("Tokens"))
        .navigationBarItems(trailing: LogOutButton(logOutFunction: usersViewModel.signOut))
    }
}

// MARK:- Preview
struct TokensView_Previews: PreviewProvider {
    static var previews: some View {
        TokensView(usersViewModel: UsersViewModel())
    }
}
