//
//  EarthquakeListView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import SwiftUI

struct EarthquakeListView: View {
    @ObservedObject var state: EarthquakesState
    @ObservedObject var settings: SettingsState
    
    var body: some View {
        NavigationStack {
            Group {
                if let earthquakes = state.earthquakes {
                    List(earthquakes) { earthquake in
                        NavigationLink {
                            EarthquakeDetailView(earthquake: earthquake)
                        } label: {
                            EarthquakeRow(earthquake: earthquake)
                        }
                    }
                    
                } else {
                    Text("No earthquakes")
                    Spacer()
                }
            }
            .onAppear {
                state.fetchEarthquakes(startTime: settings.dateStart, endTime: settings.dateEnd)
            }
            .onChange(of: settings.dateStart) {
                state.fetchEarthquakes(startTime: settings.dateStart, endTime: settings.dateEnd)
            }
            .onChange(of: settings.dateEnd) {
                state.fetchEarthquakes(startTime: settings.dateStart, endTime: settings.dateEnd)
            }
            .navigationTitle("Earthquakes")
            .toolbar {
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "gearshape")
                }
            }
            
        }
        .opacity(state.isLoading ? 0.5 : 1)
        LoadingIndicator()
            .opacity(state.isLoading ? 1 : 0)
    }
}

#Preview("Default") {
    EarthquakeListView(state: EarthquakesState.previewStateDefault, settings: SettingsState())
}

#Preview("Default") {
    EarthquakeListView(state: EarthquakesState.previewStateLoading, settings: SettingsState())
}
