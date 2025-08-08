//
//  Habit.swift
//  HabitTracker
//
//  Created by Till Gartner on 08.08.25.
//
import Foundation

@Observable
class Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String?
    var counter: Int
    
    init(_ name:String) {
        self.name = name
        self.counter = 0
    }
    init(name:String, description: String) {
        self.name = name
        self.description = description
        self.counter = 0
    }
}

@Observable
class Habits {
    var habits = [Habit]() {
        didSet {
           save()
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode(
                [Habit].self,
                from: savedItems
            ) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
    private func save() {
           if let encoded = try? JSONEncoder().encode(habits) {
               UserDefaults.standard.set(encoded, forKey: "Habits")
               print("Saved Habits to UserDefaults")
           }
       }
    func incrementCounter(for habit: Habit) {
        habit.counter += 1
        print("Will increase \(habit.name)'s counter, new value: \(habit.counter + 1)")

        save()
    }

}
