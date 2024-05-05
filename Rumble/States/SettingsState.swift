//
//  SettingsState.swift
//  Rumble
//
//  Created by Brian Sakhuja on 11/21/23.
//

import Foundation

class SettingsState: ObservableObject {
    
    @Published var dateStart: Date = Date.yesterday
    @Published var dateEnd: Date = Date.now
    
    @Published var magnitudeLower: Int = 0
    @Published var magnitudeUpper: Int = 10
    
    @Published var isListView: Bool = true
    @Published var isMapView: Bool = false
    
    @Published var isPresented: Bool = false
    
    let maximumMagnitude = 10
    
    var availableMinMagnitudes: Range<Int> {
        0..<magnitudeUpper+1
    }
    
    var availableMaxMagnitudes: Range<Int>  {
        magnitudeLower..<maximumMagnitude+1
    }
    
    func toggleMapList() {
        isListView.toggle()
        isMapView.toggle()
    }
}
