//
//  ContentView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var state = QuakesListState(earthquakeService: EarthquakeService())
    
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
                }
            }
            .onAppear {
                state.fetchEarthquakes()
            }
            .navigationTitle("Earthquakes")
            
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
