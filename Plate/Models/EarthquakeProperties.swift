//
//  EarthquakeProperties.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import Foundation

struct Quakes: Codable {
    let quakes: [Quakes]
}

struct EarthquakeProperties: Identifiable {
    
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL?
    var id: String { code }
    let tsunami: Bool?
    let title: String
}

extension EarthquakeProperties: Decodable {
    private enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case code
        case detail
        case tsunami
        case title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawMagnitude = try? values.decode(Double.self, forKey: .magnitude)
        let rawPlace = try? values.decode(String.self, forKey: .place)
        let rawTime = try? values.decode(Date.self, forKey: .time)
        let rawCode = try? values.decode(String.self, forKey: .code)
        let rawDetail = try? values.decode(URL.self, forKey: .detail)
        let rawTsunami = try? values.decode(Bool.self, forKey: .tsunami)
        let rawTitle = try? values.decode(String.self, forKey: .title)
        
        guard let magnitude = rawMagnitude,
              let place = rawPlace,
              let time = rawTime,
              let code = rawCode,
              let detail = rawDetail,
              let title = rawTitle
        else {
            throw QuakeError.missingData
        }
        
        self.magnitude = magnitude
        self.place = place
        self.time = time
        self.code = code
        self.detail = detail
        self.tsunami = rawTsunami
        self.title = title
    }
}

extension EarthquakeProperties {
    static let testEarthquakeProperties = EarthquakeProperties(magnitude: 2.4, place: "Los Angeles, CA", time: Date(), code: "code", detail: nil, tsunami: false, title: "M 1.4 - 32 km N of Petersville, Alaska")
}


