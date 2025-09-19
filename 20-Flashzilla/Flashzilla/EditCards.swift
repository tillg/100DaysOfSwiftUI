//
//  EditCards.swift
//  Flashzilla
//
//  Created by Paul Hudson on 08/05/2024.
//
import SwiftData
import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query() var cards: [Card]
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    var body: some View {

        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }

                Section {
                    ForEach(cards, id: \.self) { card in
                        VStack(alignment: .leading) {
                            Text(card.prompt)
                                .font(.headline)
                            Text(card.answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
        }
    }

    func done() {
        dismiss()
    }

    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        modelContext.insert(card)
        newPrompt = ""
        newAnswer = ""
    }

    func removeCards(at offsets: IndexSet) {
        for index in offsets {
            let card = cards[index]
            modelContext.delete(card)
        }
    }
}

#Preview {
    EditCards()
}
