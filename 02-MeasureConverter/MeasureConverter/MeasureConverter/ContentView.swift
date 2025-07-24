//
//  ContentView.swift
//  MeasureConverter
//
//  Created by Till Gartner on 23.07.25.
//

import SwiftUI

struct MeasureConverter {
    var millimeter: Double
    var centimeter: Double {
        get {
            return self.millimeter / 10
        }
        set {
            self.millimeter = newValue * 10
        }
    }
    var meter: Double {
        get {
            return self.millimeter / 1000
        }
        set {
            self.millimeter = newValue * 1000
        }
    }
    var kilometer: Double {
        get {
            return self.millimeter / 1000000
        }
        set {
            self.millimeter = newValue * 1000000
        }
    }
}

struct ContentView: View {
    @State private var fromUnit: String = "Meter"
    @State private var toUnit: String = "Kilometer"
    @State private var converter: MeasureConverter = MeasureConverter(millimeter: 100)
    
    private var units: [String] = ["Millimeter", "Centimeter","Meter", "Kilometer"  ]
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
                Section ("Value in \(fromUnit)") {
                    switch fromUnit {
                    case "Millimeter":
                        TextField("Value", value: $converter.millimeter, format: .number)
                    case "Centimeter":
                        TextField("Value", value: $converter.centimeter, format: .number)
                    case "Meter":
                        TextField("Value", value: $converter.meter, format: .number)
                    case "Kilometer":
                        TextField("Value", value: $converter.kilometer, format: .number)
                    default:
                        Text("No valid From-Unit")
                    }
                }
                Section("Value in \(toUnit)") {
                    switch toUnit {
                    case "Millimeter":
                        Text(converter.millimeter, format: .number)
                    case "Centimeter":
                        Text(converter.centimeter, format: .number)
                    case "Meter":
                        Text(converter.meter, format: .number)
                    case "Kilometer":
                        Text(converter.kilometer, format: .number)
                    default:
                        Text("No valid To-Unit")
                    }
                }
                
            }
            
        }
    }
}


#Preview {
    ContentView()
}

    
