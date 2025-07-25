//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Till Gartner on 25.07.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach([1, 2, 3], id: \.self) { line  in
                HStack {ForEach([1, 2, 3], id: \.self) { col in
                    Text("L: \(line) C: \(col)")
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
