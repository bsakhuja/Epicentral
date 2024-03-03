//
//  EarthquakeListView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import SwiftUI

struct EarthquakeListView: View {
    @State private var searchText = ""
    @ObservedObject var state: EarthquakesState
    @EnvironmentObject var settings: SettingsState
    
    var filteredEarthquakes: [Earthquake]? {
        state.earthquakes?.filter {
            $0.properties.magnitude < Double(settings.magnitudeUpper) &&
            $0.properties.magnitude > Double(settings.magnitudeLower)
        }
    }
    
    var searchResults: [Earthquake]? {
        if searchText.isEmpty {
            return filteredEarthquakes
        } else {
            return filteredEarthquakes?.filter {
                $0.properties.place?.contains(searchText) ?? false
            }
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                Group {
                    if let earthquakes = searchResults, earthquakes.count > 0 {
                        List(earthquakes) { earthquake in
                            NavigationLink {
                                EarthquakeDetailView(earthquake: earthquake)
                                    .onAppear {
                                        withAnimation {
                                            state.shouldShowFloatingButton = false
                                        }
                                    }
                                    .onDisappear {
                                        withAnimation {
                                            state.shouldShowFloatingButton = true
                                        }
                                    }
                                
                            } label: {
                                EarthquakeRow(earthquake: earthquake)
                            }
                        }
                        
                    } else {
                        Text("No earthquakes to show").font(.title)
                        Text("Try adjusting your search settings or query").font(.subheadline)
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
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
                .sheet(isPresented: $settings.isPresented) {
                    SettingsView(state: settings)
                }
                
            }
            .searchable(text: $searchText)
//                ForEach(searchResults, id: \.self) { result in
//                                Text("Are you looking for \(result)?").searchCompletion(result)
//                            }
//                        }
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
