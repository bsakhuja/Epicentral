//
//  EarthquakeDetailView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/8/23.
//

import SwiftUI
import MapKit

struct EarthquakeDetailView: View {
    
    let earthquake: Earthquake

    var body: some View {
        Map(initialPosition: earthquake.geometry.mapCameraPosition) {
            Marker(earthquake.properties.place ?? "Place", coordinate: earthquake.geometry.coordinate2D)
            
        }
        .mapControls {
//            MapUserLocationButton()
//            MapCompass()
//            MapScaleView()
        }
        ScrollView {
            VStack(alignment: .leading) {
                Text(earthquake.properties.title)
                    .font(.title)
                Spacer()
                    .frame(height: 24)
                HStack {
                    Text("Magnitude")
                    Spacer()
                    Text(preciseRound(earthquake.properties.magnitude, precision: .hundredths))
                }
                HStack {
                    Text("Date & Time")
                    Spacer()
                    Text(earthquake.properties.date.formatted(.dateTime))
                }
                if let tsunami = earthquake.properties.tsunami {
                    HStack {
                        Text("Tsunami warning")
                        Spacer()
                        Text(tsunami ? "Yes" : "No")
                    }
                }
                
                
                
            }
        }
        .padding()
        .navigationTitle("Earthquake details")
    }
}

#Preview {
    EarthquakeDetailView(earthquake: Earthquake.testEarthquake)
}
