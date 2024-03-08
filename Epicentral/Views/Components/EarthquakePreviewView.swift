//
//  EarthquakePreviewView.swift
//  Epicentral
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
                Text(earthquake.properties.title)
                    .font(.headline)
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
            if let tsunami = earthquake.properties.tsunami {
                HStack {
                    Text("Tsunami warning")
                    Spacer()
                    Text(tsunami ? "Yes" : "No")
                }
            }
            Button("Details") {
                isShowingDetails = true
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
