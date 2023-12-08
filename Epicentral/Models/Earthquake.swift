//
//  Earthquake.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/8/23.
//

import Foundation

struct Earthquake: Identifiable, Decodable {
    
    var id: String
    let type: String
    let properties: EarthquakeProperties
    let geometry: EarthquakeGeometry
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case properties
        case geometry
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(String.self, forKey: .id)
        let rawType = try? values.decode(String.self, forKey: .type)
        let rawProperties = try? values.decode(EarthquakeProperties.self, forKey: .properties)
        let rawGeometry = try? values.decode(EarthquakeGeometry.self, forKey: .geometry)
        
        guard let id = rawId,
              let type = rawType,
              let properties = rawProperties,
              let geometry = rawGeometry
        else {
            throw QuakeError.missingData
        }
        
        self.id = id
        self.type = type
        self.properties = properties
        self.geometry = geometry
    }
}

extension Earthquake {
    init(id: String, type: String, properties: EarthquakeProperties, geometry: EarthquakeGeometry) {
        self.id = id
        self.type = type
        self.properties = properties
        self.geometry = geometry
    }
    
    static let testEarthquake = Earthquake(id: "", type: "Feature", properties: EarthquakeProperties.testEarthquakeProperties, geometry: EarthquakeGeometry.testEarthquakeGeometry)
}

extension Earthquake: Hashable {
    static func == (lhs: Earthquake, rhs: Earthquake) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
