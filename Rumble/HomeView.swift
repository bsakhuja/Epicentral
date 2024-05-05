//
//  HomeView.swift
//  Rumble
//
//  Created by Brian Sakhuja on 11/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var settings: SettingsState
    @StateObject var state = EarthquakesState(earthquakeService: EarthquakeService())
    
    @State private var mapMode: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if settings.isListView {
                EarthquakeListView(state: state)
            } else {
                EarthquakesMapView(state: state)
            }
            
            FloatingButtonView(
                imageName: settings.isListView ? "map" : "list.dash",
                action: {
                    withAnimation {
                        settings.toggleMapList()
                    }
                })
            .padding()
            .opacity(state.shouldShowFloatingButton ? 1 : 0)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(SettingsState())
}
