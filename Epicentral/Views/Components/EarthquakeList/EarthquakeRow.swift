//
//  EarthquakeRow.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import SwiftUI

struct EarthquakeRow: View {
    var earthquake: Earthquake
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("Magnitude")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                    Text(preciseRound(earthquake.properties.magnitude, precision: .hundredths))
                        .font(.title)
                        .bold()
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(earthquake.properties.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                    Text(earthquake.properties.place ?? "Place")
                        .font(.subheadline)
                        .multilineTextAlignment(.trailing)
                    
                }
            }
    }
}

#Preview {
    EarthquakeRow(earthquake: Earthquake.testEarthquake)
}
