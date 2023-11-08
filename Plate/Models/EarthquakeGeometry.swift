//
//  EarthquakeGeometry.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/8/23.
//

import Foundation

struct EarthquakeGeometry: Identifiable, Decodable {
    var id: String { coordinates.description }
    let type: String
    let coordinates: [Double]
    
    private enum CodingKeys: String, CodingKey {
        case type
        case coordinates
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawType = try? values.decode(String.self, forKey: .type)
        let rawCoordinates = try? values.decode([Double].self, forKey: .coordinates)
        
        guard let type = rawType,
              let coordinates = rawCoordinates
        else {
            throw QuakeError.missingData
        }
        
        self.type = type
        self.coordinates = coordinates
    }
}

extension EarthquakeGeometry {
    init(type: String, coordinates: [Double]) {
        self.type = type
        self.coordinates = coordinates
    }
    
    static let testEarthquakeGeometry = EarthquakeGeometry(type: "Point", coordinates: [-116.7776667,33.6633333,11.008])
}
