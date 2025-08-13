//
//  ContentView.swift
//  SwiftPlayground
//
//  Created by Till Gartner on 08.08.25.
//

import SwiftUI
struct ContentView: View {
    @State private var isSigned = true

    var body: some View {
        VStack {
            Button("Sign This Document") {
                isSigned.toggle()
            }

            Image(systemName: "signature")
                .symbolEffect(.drawOn.wholeSymbol, isActive: isSigned)

            Image(systemName: "signature")
                .symbolEffect(.drawOn, isActive: isSigned)

            Image(systemName: "signature")
                .symbolEffect(.drawOn.individually, isActive: isSigned)
        }
        .font(.largeTitle)
    }
}
#Preview {
    ContentView()
}
