//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Till Gartner on 08.08.25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""
    @State private var description: String = ""

    var habits: Habits

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let newHabit = Habit(name: name, description: description)
                    habits.habits.append(newHabit)
                    print("Added habit \(newHabit.name)")
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habits: Habits())
}
