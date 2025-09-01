//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Paul Hudson on 08/05/2024.
//

import CoreLocation
import Foundation
import LocalAuthentication
import MapKit
import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")

        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = false
        var showAlert: Bool = false
        var alertMessage: String = ""
        var alertTitle: String = ""
        private var mapStyleString = "standard"
        var mapStyle: MapStyle {
            switch mapStyleString {
                case "standard": .standard
                case "hybrid": .hybrid
                case "imagery": .imagery
                default: .standard
            }
        }
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }

        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
                alertTitle = "Error"
                alertMessage = "Unable to save data."
                showAlert = true
            }
        }

        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }

        func update(location: Location) {
            guard let selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }

        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                    } else {
                        self.alertTitle = "Error"
                        self.alertMessage = "Authentication failed."
                        self.showAlert = true
                    }
                }
            } else {
                self.alertTitle = "Error"
                self.alertMessage = "No Biometric Authentication available."
                self.showAlert = true
            }
        }
        
        func switchMapStyle() {
            switch mapStyleString  {
            case "standard":
                mapStyleString = "hybrid"
            case "hybrid":
                mapStyleString = "imagery"
            default:
                mapStyleString = "standard"
            }
        }
    }
}
