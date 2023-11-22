//
//  ContentView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var state = QuakesListState(earthquakeService: EarthquakeService())
    
    @State private var dateStart: Date = Date.yesterday
    @State private var dateEnd: Date = Date.now
    @State private var mapMode: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                DatePicker("Start date", selection: $dateStart, displayedComponents: .date)
                DatePicker("End date", selection: $dateEnd, displayedComponents: .date)
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
                    state.fetchEarthquakes(startTime: dateStart, endTime: dateEnd)
                }
                .onChange(of: dateStart) {
                    state.fetchEarthquakes(startTime: dateStart, endTime: dateEnd)
                }
                .onChange(of: dateEnd) {
                    state.fetchEarthquakes(startTime: dateStart, endTime: dateEnd)
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
}

#Preview {
    ContentView()
}
