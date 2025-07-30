//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Till Gartner on 29.07.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .background(.blue)
            .frame(minWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
