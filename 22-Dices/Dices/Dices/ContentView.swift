//
//  ContentView.swift
//  Dices
//
//  Created by Till Gartner on 19.09.25.
//

import SwiftUI

struct ContentView: View {
    @State private var dice1: Int = 1
    @State private var dice2: Int = 1
    
    var body: some View {
        VStack {
            Image(.dice)
                .resizable()
                .scaledToFit()
            Spacer()
            HStack {
                DiceView(value: dice1)
                DiceView(value: dice2)
            }
            
            Button("Role'em!") {
                dice1 = Int.random(in: 1...6)
                dice2 = Int.random(in: 1...6)
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
