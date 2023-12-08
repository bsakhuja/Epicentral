//
//  EarthquakeListView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import SwiftUI

struct EarthquakeListView: View {
    @ObservedObject var state: EarthquakesState
    @EnvironmentObject var settings: SettingsState
    
    var body: some View {
        ZStack {
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
                        settings.isPresented.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
                .sheet(isPresented: $settings.isPresented) {
                    SettingsView(state: settings)
                }
                
            }
            .opacity(state.isLoading ? 0.5 : 1)
            
            LoadingIndicator()
                .opacity(state.isLoading ? 1 : 0)
        }
        
    }
}

#Preview("Default") {
    EarthquakeListView(state: .previewStateDefault)
        .environmentObject(SettingsState())
}

#Preview("Loading") {
    EarthquakeListView(state: .previewStateLoading)
        .environmentObject(SettingsState())
}
