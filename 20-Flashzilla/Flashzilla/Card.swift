//
//  Card.swift
//  Flashzilla
//
//  Created by Paul Hudson on 08/05/2024.
//

import Foundation
import SwiftData

@Model
class Card {
    var prompt: String
    var answer: String
    
    init(prompt: String, answer: String) {
        self.prompt = prompt
        self.answer = answer
    }

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
