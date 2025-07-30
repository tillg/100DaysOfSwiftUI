//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Till Gartner on 30.07.25.
//

import SwiftUI

let choices: [String] = ["rock", "paper", "scissors"]


struct ChoiceSymbol: View {
    var choice: String
    var body: some View {
            switch choice {
            case "rock":
                Image(systemName: "mountain.2", )
            case "paper":
                Image(systemName: "newspaper")
            case "scissors":
                Image(systemName: "scissors")
            default:
                Image(systemName: "xmark.circle")
            }
        }
    }


struct ContentView: View {
    @State private var score = 0
    @State private var round = 0
    @State private var appsChoice: String = choices.randomElement() ?? ""
    @State private var userShouldWin = Bool.random()
    @State private var userChoice: String = ""

    func resetGame() {
        appsChoice = choices.randomElement() ?? ""
        userShouldWin.toggle()
    }
    func evalGame() {
        round += 1
        let userWon = beats(choice1: userChoice, choice2: appsChoice)
        score += userWon == userShouldWin ? 1 : 0
    }

    func beats(choice1: String, choice2: String) -> Bool? {
        switch (choice1)
        {
        case "rock":
            return choice2 == "scissors"
        case "paper":
            return choice2 == "rock"
        case "scissors":
            return choice2 == "paper"
        default:
            return nil
        }
    }
    var body: some View {
        VStack {
            Spacer()
            Text("Score: \(score)")
            Text("Rounds played: \(round)")
            Spacer()
            HStack{
                Text("App's choice:")
                ChoiceSymbol(choice: appsChoice)
            }
            Text("User SHOULD \(userShouldWin ? "" : "NOT ")win")
            Spacer()
            Picker("Choose", selection: $userChoice) {
                ForEach(choices, id: \.self) {
                    ChoiceSymbol(choice: $0)
                }
            }.pickerStyle(.segmented)
            Button("Go") {
                evalGame()
                resetGame()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
