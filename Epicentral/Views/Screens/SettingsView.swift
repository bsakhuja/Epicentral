//
//  SettingsView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/9/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var state: SettingsState
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Date & Time", content: {
                    DatePicker("Start date", selection: $state.dateStart, displayedComponents: .date)
                    DatePicker("End date", selection: $state.dateEnd, displayedComponents: .date)
                })
                Section("Magnitude", content: {
                    Text("No magnitude filter")
                    Text("Minimum magnitude")
                    Text("Maximum magnitude")
                })
                Section("Location", content: {
                    Text("Sorted by distance")
                    Text("Max distance from location")
                    Text("Location")
                })
            }
            .navigationTitle("Search Settings")
        }
        
        
    }
}

#Preview("Default") {
    SettingsView(state: SettingsState())
}
