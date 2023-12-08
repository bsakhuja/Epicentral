//
//  PlateTests.swift
//  PlateTests
//
//  Created by Brian Sakhuja on 11/7/23.
//

import XCTest
@testable import Plate

final class PlateTests: XCTestCase {
    
    func testGeoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let quake = try decoder.decode(EarthquakeProperties.self, from: testFeature_nc73649170)
        
        XCTAssertEqual(quake.code, "73649170")
        
        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = quake.time.timeIntervalSince1970
        
        
        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)
    }
    
    func testGeoJSONDecoderDecodesGeoJSON() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(GeoJSON.self, from: testQuakesData)


        XCTAssertEqual(decoded.earthquakes.count, 6)
        XCTAssertEqual(decoded.earthquakes[0].properties.code, "73649170")


        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = decoded.earthquakes[0].properties.time.timeIntervalSince1970
        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)
    }
}
