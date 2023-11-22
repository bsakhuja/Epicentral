//
//  QuakesListState.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import Foundation
import Combine

class QuakesListState: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let earthquakeService: EarthquakeServiceProtocol
    @Published var earthquakes: [Earthquake]?
    @Published var isLoading: Bool = true
    
    init(earthquakeService: EarthquakeServiceProtocol) {
        self.earthquakeService = earthquakeService
    }
    
    func fetchEarthquakes(startTime: Date, endTime: Date) {
        isLoading = true
        earthquakeService.getEarthquakes(startTime: startTime, endTime: endTime)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
            
        }, receiveValue: {[weak self] data in
            self?.earthquakes = data.earthquakes
            self?.isLoading = false
        }).store(in: &cancellables)
    }
}
