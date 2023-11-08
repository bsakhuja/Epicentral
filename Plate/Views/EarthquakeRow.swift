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
                Text(earthquake.properties.magnitude.description)
                    .font(.title)
                    .bold()
                Spacer()
                VStack(alignment: .trailing) {
                    Text(earthquake.properties.place)
                    Text(earthquake.properties.time.formatted())
                }
            }
    }
}

#Preview {
    EarthquakeRow(earthquake: Earthquake.testEarthquake)
}
