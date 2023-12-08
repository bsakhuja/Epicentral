//
//  SettingsView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/9/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var state: SettingsState
    
    var body: some View {
        VStack {
            DatePicker("Start date", selection: $state.dateStart, displayedComponents: .date)
            DatePicker("End date", selection: $state.dateEnd, displayedComponents: .date)
        }
        
    }
}

#Preview("Default") {
    SettingsView(state: SettingsState())
}
