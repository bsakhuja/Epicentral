//
//  EarthquakeDetailView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/8/23.
//

import SwiftUI

struct EarthquakeDetailView: View {
    
    let earthquake: Earthquake
    var body: some View {
        ScrollView {
            Text(earthquake.properties.code)
            if let tsunami = earthquake.properties.tsunami {
                Text(tsunami.description)
            }
            
        }
        .navigationTitle(earthquake.properties.title)
    }
}

#Preview {
    EarthquakeDetailView(earthquake: Earthquake.testEarthquake)
}
