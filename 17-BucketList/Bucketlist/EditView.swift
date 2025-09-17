//
//  EditView.swift
//  BucketList
//
//  Created by Paul Hudson on 08/05/2024.
//

import SwiftUI

struct EditView: View {
    enum LoadingState {
        case loading, loaded, failed
    }

    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    @State private var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.location.name)
                    TextField("Description", text: $viewModel.location.description)
                }

                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()

                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
        
    

    init(location: Location, onSave: @escaping (Location) -> Void) {
        print("Initatiating EditView for \(location)")
        viewModel = .init(location: location)
        self.onSave = onSave
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
