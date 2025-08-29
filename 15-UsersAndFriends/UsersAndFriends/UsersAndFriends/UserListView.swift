//
//  UserListView.swift
//  UsersAndFriends
//
//  Created by Till Gartner on 17.08.25.
//

import SwiftUI

struct UserListView: View {
    let users: [User]
    let userId: UUID
    var user: User {
        User.userById(users: users, userId: userId)
    }
    
    var body: some View {
        NavigationLink(destination: UserView(users: users, userId: user.id)) {
            HStack {
                Text(user.name)
                Spacer()
                Image(systemName: user.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(user.isActive ? .green : .red)
            }
        }
    }
}

#Preview {
    UserListView(users: [User.example], userId: User.example.id)
}
