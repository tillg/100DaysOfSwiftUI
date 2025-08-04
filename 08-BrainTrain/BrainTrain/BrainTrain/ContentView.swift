//
//  ContentView.swift
//  BrainTrain
//
//  Created by Till Gartner on 03.08.25.
//

import SwiftUI

struct ContentView: View {
    @State  private var showSettings = false
    @State private var multiplicationTable = 2
    @State private var numberToMultiply = Int.random(in: 1...12)
    @State private var enteredAnswer = 0
    @State private var numberOfQuestions = 10
    @State private var showResult = false
    @State private var resultIsCorrect = false
    @State private var resultString = ""
    let numberOfQuestionsOptions = [5, 10, 20]
    
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "brain")
                Image(systemName: "figure.strengthtraining.traditional")
                Image(systemName: "tram")
            }
            .symbolRenderingMode(.monochrome)
            .symbolVariant(.none)
            .fontWeight(.bold)
            .foregroundStyle(.green)
            .symbolEffect(.bounce, options: SymbolEffectOptions.speed(0.001))
            Spacer()
            Text("Multiplication Table")
            Picker("Muliplication Table", selection: $multiplicationTable) {
                ForEach(2..<12, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.segmented)
            Text("Number of questions")
            Picker("Number of questions", selection: $numberOfQuestions) {
                ForEach(numberOfQuestionsOptions, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.segmented)

            Spacer()
            Spacer()

            Text("\(multiplicationTable) x \(numberToMultiply)")
                .font(.headline)
            Text("=")
            TextField("Your answer", value: $enteredAnswer, format: .number)
                .keyboardType(.numberPad)
            if showResult {
                Text(resultString)
            }
            Button("Check") {
                numberEntered()
            }
            Spacer()
        }
    }
    
    func numberEntered() {
        resultIsCorrect = enteredAnswer == multiplicationTable * numberToMultiply
        resultString = "\(multiplicationTable) x \(numberToMultiply) = \(multiplicationTable * numberToMultiply) \n"
        if resultIsCorrect {
            resultString += " Well done!"
        } else {
            resultString += " Keep trying!"
        }
        showResult = true
        askQuestion()
    }
    
    
    func askQuestion() {
        numberToMultiply = Int.random(in: 1...12)
    }
}

#Preview {
    ContentView()
}
