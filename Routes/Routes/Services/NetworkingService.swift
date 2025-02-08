//
//  NetworkingService.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import Foundation
import OSLog
import SwiftUICore

enum NetworkingError: Error {
    case invalidURL
}

class NetworkingService {
    
    static let shared = NetworkingService()
    
    let baseURL = "https://staging-encoreintro-ds92.encr.app"
    
    enum routes: String {
        case test = "/hello"
        case offices = "/eidra-offices-real"
        case restaurants = "/restaurants"
    }
    
    private init() {}
    
    func fetchOffices() async throws -> Offices {
        guard let url = URL(string: "\(baseURL)\(routes.offices.rawValue)") else { throw NetworkingError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Offices.self, from: data)
    }
    
    func fetchRestaurants(officeId: Int) async throws -> RestaurantModel {
        guard let url = URL(string: "\(baseURL)\(routes.restaurants.rawValue)/\(officeId)") else { throw NetworkingError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(RestaurantModel.self, from: data)
    }
}
