//
//  ContentView.swift
//  MeasureConverter
//
//  Created by Till Gartner on 23.07.25.
//

import SwiftUI

struct ContentView: View {
    @State private var fromUnit: String = "Meter"
    @State private var toUnit: String = "Kilometer"
    @State private var value = 1.0
    
    private var units: [String] = ["Meter", "Kilometer", "Centimeter", "Millimeter"]
    var body: some View {
        NavigationView {
            Form {
                Section("From Unit") {
                    Picker("From unit", selection: $fromUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("To Unit") {
                    Picker("To Unit", selection: $toUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section ("Value in \(fromUnit)"){
                    TextField("Value", value: $value, format: .number)
                }
                Section("Value in \(toUnit)") {
                    Text(42.0, format: .number)

                }
                        
                }
            }
        }
    }

#Preview {
    ContentView()
}
