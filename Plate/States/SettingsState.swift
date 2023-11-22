//
//  SettingsState.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import Foundation

class SettingsState: ObservableObject {
    
    @Published var dateStart: Date = Date.yesterday
    @Published var dateEnd: Date = Date.now
}
