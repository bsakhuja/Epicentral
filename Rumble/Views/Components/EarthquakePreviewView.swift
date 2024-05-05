//
//  EarthquakePreviewView.swift
//  Rumble
//
//  Created by Brian Sakhuja on 3/7/24.
//

import SwiftUI

struct EarthquakePreviewView: View {
    
    @State private var isShowingDetails: Bool = false
    
    let earthquake: Earthquake
    
    var body: some View {
        VStack {
            HStack {
                Button(earthquake.properties.title) {
                    isShowingDetails = true
                }
                .font(.headline)
                .multilineTextAlignment(.leading)
                Spacer()
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
        }
        .padding()
        .sheet(isPresented: $isShowingDetails) {
            EarthquakeDetailView(earthquake: earthquake)
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    EarthquakePreviewView(earthquake: Earthquake.testEarthquake)
}
