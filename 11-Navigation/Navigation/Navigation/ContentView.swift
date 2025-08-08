//
//  ContentView.swift
//  Navigation
//
//  Created by Till Gartner on 08.08.25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
        Text("Current path depth: \(path.count)")
        VStack {
            ForEach(path, id: \.self) {
                Text("Path entry: \($0)")
            }
        }

    }
}

struct ContentView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
        .toolbar {
            Button("Home") {
                path.removeAll()
            }
        }
    }
}
#Preview {
    ContentView()
}
