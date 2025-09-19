//
//  DiceView.swift
//  Dices
//
//  Created by Till Gartner on 19.09.25.
//

import SwiftUI

struct DiceView: View {
    let value: Int
    var body: some View {
        Text("Dice with \(value)")
    }
}

#Preview {
    DiceView(value: 4)
}
