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
                Section("Date & Time") {
                    DatePicker("Start date", selection: $state.dateStart, displayedComponents: .date)
                    DatePicker("End date", selection: $state.dateEnd, displayedComponents: .date)
                }
                Section("Magnitude") {
                    Picker("Minimum magnitude", selection: $state.magnitudeLower) {
                        ForEach(state.availableMinMagnitudes, id: \.self) { mag in
                            Text(String(mag))
                        }
                        
                    }
                    Picker("Minimum magnitude", selection: $state.magnitudeUpper) {
                        ForEach(state.availableMaxMagnitudes, id: \.self) { mag in
                            Text(String(mag))
                        }
                        
                    }
                }
                //                Section("Location", content: {
                //                    Text("Sorted by distance")
                //                    Text("Max distance from location")
                //                    Text("Location")
                //                })
                //                Section("Magnitude", content: {
                //                    Text("No magnitude filter")
                //                    Text("Minimum magnitude")
                //                    Text("Maximum magnitude")
                //                })
                //                Section("Location", content: {
                //                    Text("Sorted by distance")
                //                    Text("Max distance from location")
                //                    Text("Location")
                //                })
                
                Section("About") {
                    Text("Epicentral version \(AppVersionProvider.versionAndBuild)")
                    Text("Made by Brian Sakhuja")
                    Text("Earthquake data from USGS")
                }
            }
            .navigationTitle("Search Settings")

        }
        
        
    }
}

#Preview("Default") {
    SettingsView(state: SettingsState())
}
