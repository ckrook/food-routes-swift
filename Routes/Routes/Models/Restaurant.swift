//
//  Restaurant.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import Foundation

struct RestaurantModel: Codable {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let rating: Double?
    let totalRatings: Int?
    let lat: Double
    let long: Double
    let metadata: Metadata?
    
    enum CodingKeys: String, CodingKey {
        case name
        case rating
        case totalRatings = "total_ratings"
        case lat = "lat"
        case long = "long"
        case metadata
    }
    
    
    
//    let cuisine: String?
//    let contactInfo: ContactInfo?
////    let location: Location
//    let details: RestaurantDetails?
//    let options: RestaurantOptions?
//    let reviews: [Review]?
}

struct Metadata: Codable {
    let servesLunch: Bool?
    let curbsidePickup: Bool?
    let servesVegetarian: Bool?
    let placeID: String?
    let website: String?
    
    enum CodingKeys: String, CodingKey {
        case servesLunch = "serves_lunch"
        case curbsidePickup = "curbside_pickup"
        case servesVegetarian = "serves_vegetarian"
        case placeID = "place_id"
        case website

    }
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
