//
//  EarthquakesMapView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import SwiftUI
import MapKit

struct EarthquakesMapView: View {
    
    @ObservedObject var state: EarthquakesState
    
    @State var region = MKCoordinateRegion(center:.init(latitude: -32.5,
                                                        longitude: 115.75),
                                           latitudinalMeters: 100_000,
                                           longitudinalMeters: 100_000)
    
    var body: some View {
        if let earthquakes = state.earthquakes {
            Map() {
                ForEach(earthquakes, id: \.self) { result in
                    Marker(result.id, coordinate: result.geometry.coordinate2D)
                }
            }
        } else {
            Text("No earthquakes! Try adjusting your search criteria.")
        }
        
    }
}

#Preview {
    EarthquakesMapView(state: .previewStateDefault)
}
