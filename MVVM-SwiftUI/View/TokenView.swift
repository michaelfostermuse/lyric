//
//  TokenView.swift
//  MVVM-SwiftUI
//
//  Created by Michael Muse on 4/8/22.
//

import SwiftUI

struct TokenView: View {
    
    @ObservedObject var usersViewModel:UsersViewModel
    @EnvironmentObject var accountManager:AccountManager
    @State private var selection: String? = nil
    
    var body: some View {
        ZStack{
            Image("Image2")
                    VStack {
                        NavigationLink(destination: TokensView(usersViewModel: self.usersViewModel), tag: "tokens", selection: $selection)  { EmptyView() }
                            Button(action:
                            {
                                selection = "tokens"
                            }) {
                                Text("Show User Tokens")
                                    .padding([.leading,.trailing],30)
                                    .padding([.top,.bottom],15)
                            }
                            .foregroundColor(.white)
                            .background(Color(.blue))
                            .cornerRadius(3)
                           
                        
                    }
                    .navigationBarItems(trailing: LogOutButton(logOutFunction: accountManager.signOut))
        }
    }
}

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView(usersViewModel: UsersViewModel(dataService: DataService()))
    }
}
