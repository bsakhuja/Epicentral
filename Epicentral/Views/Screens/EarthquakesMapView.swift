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
    
    @State private var selectedEarthquake: Earthquake?
    
    var body: some View {
        if let earthquakes = state.earthquakes {
            Map(selection: $selectedEarthquake) {
                ForEach(earthquakes, id: \.self) { result in
                    Marker(result.properties.title, coordinate: result.geometry.coordinate2D)
                        .tag(result.id)
                }
            }
            // TODO/ make a detail view below then have button go to detail view
//            .safeAreaInset(edge: .bottom) {
//                        if let selectedEarthquake {
//                            Text(selectedEarthquake.id)
//                                .frame(height: 128)
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .padding([.top, .horizontal])
//                                
//                        }
//                    }
        } else {
            Text("No earthquakes! Try adjusting your search criteria.")
        }
        
    }
}

#Preview {
    EarthquakesMapView(state: .previewStateDefault)
}
