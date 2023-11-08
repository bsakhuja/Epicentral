//
//  NetworkManager.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/7/23.
//

import Foundation
import Combine

// https://medium.com/@islammoussa.eg/swiftui-and-combine-building-a-solid-network-layer-for-handling-api-requests-5ccce878212a

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError: Error {
    case invalidResponse
    case invalidData
}

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

enum EarthquakeEndpoint: APIEndpoint {
    case query
    
    var baseURL: URL {
        return URL(string: "https://earthquake.usgs.gov/fdsnws/event/1")!
    }
    
    var path: String {
        switch self {
        case .query:
            return "/query"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .query:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .query:
            return ["Authorization": "Bearer TOKEN"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .query:
            return ["format": "geojson", "starttime": "2014-01-01", "endtime": "2014-01-02"]
        }
    }
}

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        endpoint.parameters?.forEach { parameter in
            request.url?.append(queryItems: [
                URLQueryItem(name: parameter.key, value: "\(parameter.value)")
            ])
        }
        
        
//        print(request)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

protocol EarthquakeServiceProtocol {
    func getEarthquakes() -> AnyPublisher<GeoJSON, Error>
}

class EarthquakeService: EarthquakeServiceProtocol {
    let apiClient = URLSessionAPIClient<EarthquakeEndpoint>()
    
    func getEarthquakes() -> AnyPublisher<GeoJSON, Error> {
        return apiClient.request(.query)
    }
}
