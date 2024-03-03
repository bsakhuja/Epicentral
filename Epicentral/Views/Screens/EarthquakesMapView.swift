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
    @EnvironmentObject var settings: SettingsState
    
    @State var region = MKCoordinateRegion(center:.init(latitude: -32.5,
                                                        longitude: 115.75),
                                           latitudinalMeters: 100_000,
                                           longitudinalMeters: 100_000)
    
    @State private var selectedEarthquake: Earthquake?
    
    var filteredEarthquakes: [Earthquake]? {
        state.earthquakes?.filter {
            $0.properties.magnitude < Double(settings.magnitudeUpper) &&
            $0.properties.magnitude > Double(settings.magnitudeLower)
        }
    }
    
    var body: some View {
        if let earthquakes = filteredEarthquakes,
           earthquakes.count > 0
        {
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
            VStack {
                Spacer()
                Text("No earthquakes to show").font(.title)
                Text("Try adjusting your search settings").font(.subheadline)
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    EarthquakesMapView(state: .previewStateDefault)
}
