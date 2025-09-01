//
//  ContentView.swift
//  AlertAndConfirmation
//
//  Created by Till Gartner on 01.09.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Button("Confirmation") {
            showingConfirmation = true
        }
        .padding()
        .background(backgroundColor)
        .foregroundStyle(.black)
        .clipShape(.capsule)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    ContentView()
}
