//
//  User.swift
//  lyric
//
//  Created by Michael Muse on 4/7/22.
//  Copyright © 2022 Daniel Bastidas. All rights reserved.
//

import Foundation

class User : Codable, Hashable {
    
    var name: String
    var tokens: [String]
    
    init(name: String, token: String) {
        self.name = name
        self.tokens = [String]()
        self.addToken(token: token)
    }
    
    var identifier: String {
        return UUID().uuidString
    }
    
    func addToken(token: String) {
        self.tokens.append(token)
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
