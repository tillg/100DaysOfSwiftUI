//
//  UserView.swift
//  UsersAndFriends
//
//  Created by Till Gartner on 16.08.25.
//

import SwiftUI

struct UserView: View {
    let users: [User]
    let userId: UUID
    var user: User {
        User.userById(users: users, userId: userId)
    }
    
    var body: some View {
        NavigationStack {
            Form {
            Section("User", ) {
                HStack {
                    Text("Active")
                    Spacer()
                    Image(systemName: user.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(user.isActive ? .green : .red)
                }
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("\(user.address)")
            }
                Section("Friens") {
                    List {
                        ForEach(user.friends, id: \.self.id) { friend in
                            UserListView(users: users, userId: friend.id)
                        }
                    }
                }
            }
        }
        .navigationTitle(user.name)
    }
}

#Preview {
    UserView(users: [User.example], userId: User.example.id)
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
