//
//  EarthquakeDetailView.swift
//  Rumble
//
//  Created by Brian Sakhuja on 11/8/23.
//

import SwiftUI
import MapKit
import WebKit

struct EarthquakeDetailView: View {
    
    @EnvironmentObject var settings: SettingsState
    let earthquake: Earthquake
    
    var body: some View {
        List {
            
            // MARK: - Specifics
            
            Section("Earthquake specifics") {
                HStack {
                    Text(earthquake.properties.title)
                }
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
            
            // MARK: - Location
            
            Section("Location") {
                if let place = earthquake.properties.place {
                    Text(place)
                }
                
                NavigationLink("View on map") {
                    Map(initialPosition: earthquake.geometry.mapCameraPosition) {
                        Marker(earthquake.properties.place ?? "Place", coordinate: earthquake.geometry.coordinate2D)
                    }
                    .navigationTitle("Earthquake location")
                }
                
                if let location = settings.userLocation {
                    HStack {
                        Text("Distance from you")
                        Spacer()
                        Text("\((Int(earthquake.geometry.clLocation.distance(from: location)/1000))) km")
                    }
                    
                }
            }
            
            // MARK: - Extra
            
            Section("Extra") {
                if let url = earthquake.properties.url {
                    HStack {
                        Text("Additional details")
                        Spacer()
                        Link("View on USGS", destination: url)
                    }
                    
                }
                
                if let didYouFeelItURL = earthquake.properties.didYouFeelItUrl {
                    HStack {
                        Text("Did you feel it?")
                        Spacer()
                        Link("Report to USGS", destination: didYouFeelItURL)
                    }
                }
            }
        }
        .navigationTitle("Earthquake details")
    }
}

#Preview {
    EarthquakeDetailView(earthquake: Earthquake.testEarthquake)
        .environmentObject(SettingsState())
}
