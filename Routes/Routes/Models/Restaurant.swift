//
//  Restaurant.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import Foundation

struct Restaurant: Codable {
    let id: Int
    let name: String
    let cuisine: String
    let rating: Double
    let contactInfo: ContactInfo
    let location: Location
    let details: RestaurantDetails
    let options: RestaurantOptions?
    let reviews: [Review]?
}

struct ContactInfo: Codable {
    let address: String
    let phoneNumber: String?
    let website: String?
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let placeID: String
}

struct RestaurantDetails: Codable {
    let priceLevel: Int?
    let openingHours: [String]?
    let isOpenNow: Bool?
    let photoReference: String?
}

struct RestaurantOptions: Codable {
    let deliveryAvailable: Bool?
    let takeoutAvailable: Bool?
    let reservationRequired: Bool?
    let popularDishes: [String]?
    let menuURL: String?
}

// MARK: - Review Model
struct Review: Codable {
    let authorName: String
    let rating: Double
    let text: String
    let time: Int // Unix timestamp
}
