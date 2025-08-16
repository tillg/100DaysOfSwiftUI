//
//  Users.swift
//  UsersAndFriends
//
//  Created by Till Gartner on 16.08.25.
//

import Foundation

class friend: Codable {
    var id: UUID
    var name: String
}

class User: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [friend]
    
    
    init(id: UUID = UUID(), isActive: Bool = true, name: String = "", age: Int = 0, company: String = "", email: String = "", address: String = "", about: String = "", registered: String = "", tags: [String] = [], friends: [friend] = []) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
     static let example: User = .init(id : UUID(), isActive: true, name: "John Doe", age: 30, company: "Apple Inc.", email: "johndoe@example.com", address: "123 Main Street, New York, NY 10001", about: "I am a developer working at Apple Inc.", registered: "2017-07-24T08:18:32Z", tags: ["developer", "apple"], friends: [])
}
