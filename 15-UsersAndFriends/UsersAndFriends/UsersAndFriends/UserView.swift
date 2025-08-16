//
//  UserView.swift
//  UsersAndFriends
//
//  Created by Till Gartner on 16.08.25.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        Form {
            Section("\(user.name)", ) {
                Image(systemName: user.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(user.isActive ? .green : .red)
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("\(user.address)")
            }
        }
    }
}

#Preview {
    UserView(user: User.example)
}

//var isActive: Bool

//var age: Int
//var company: String
//var email: String
//var address: String
//var about: String
//var registered: String
//var tags: [String]
//var friends: [friend]
