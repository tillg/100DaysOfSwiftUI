//
//  ContentView.swift
//  HabitTracker
//
//  Created by Till Gartner on 08.08.25.
//

import SwiftUI

struct HabitView: View {
    var habit: Habit
    let habits: Habits
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(habit.name)
                Spacer()
                Text("\(habit.counter)")
                Button("+") {
                    habits.incrementCounter(for: habit)
                }
            }
            if let description = habit.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.habits) { habit in
                    HabitView(habit: habit, habits: habits)
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button("New habit") {
                    showingAddHabit = true
                }
            }
            
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
}

#Preview {
    ContentView()
}
