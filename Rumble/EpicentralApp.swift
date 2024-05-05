//
//  RumbleApp.swift
//  Rumble
//
//  Created by Brian Sakhuja on 11/7/23.
//

import SwiftUI

@main
struct RumbleApp: App {
    
    var settings = SettingsState()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(settings)
        }
    }
}
