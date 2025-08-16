//
//  ContentView.swift
//  UsersAndFriends
//
//  Created by Till Gartner on 16.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserView(user: user)) {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Image(systemName: user.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(user.isActive ? .green : .red)
                        }
                    }
                }
            
            }
            .toolbar {
                Button("Load users") {
                    Task {
                        await loadUsers()
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
    
    func loadUsers() async {
        print("Loading users...")
        let url = URL(
            string: "https://www.hackingwithswift.com/samples/friendface.json"
        )!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        var data: Data?
        var dataAsString: String?
        do {
            let (fileUrl, other) = try await URLSession.shared.download(
                for: request
            )
            data = try Data(contentsOf: fileUrl)
            dataAsString = String(
                data: data!,
                encoding: .utf8
            ) ?? "Could not decode data as string"
        } catch {
            fatalError("Loading Users failed: \(error.localizedDescription)")
        }
        var decodedUsers: [User] = []
        do {
            let decoder = JSONDecoder()
            //let formatter = DateFormatter()
            //formatter.dateFormat = "y-MM-dd"

            decodedUsers = try decoder.decode([User].self, from: data!)
            print("Sucvcessfully loaded \(decodedUsers.count) users.")
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError(
                "Failed to decode \(dataAsString!) due to missing key '\(key.stringValue)' – \(context.debugDescription)"
            )
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError(
                "Failed to decode \(data!) due to type mismatch – \(context.debugDescription) \(context.codingPath)"
            )
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError(
                "Failed to decode \(data!) due to missing \(type) value – \(context.debugDescription)"
            )
        } catch DecodingError.dataCorrupted(_) {
            fatalError(
                "Failed to decode \(data!) because it appears to be invalid JSON."
            )
        } catch {
            fatalError(
                "Failed to decode \(dataAsString!): \(error.localizedDescription)"
            )
        }
        users = decodedUsers
    }
}

#Preview {
    ContentView()
}
