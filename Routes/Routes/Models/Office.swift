//
//  Office.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import Foundation

struct Offices: Codable {
    let offices: [Office]
}

struct Office: Codable {
    let id: Int
    let name: String
    let lat: Double
    let long: Double
    let addressline1: String?
    let addressline2: String?
//    let address: Address?
//    let coordinates: Coordinates?
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zip: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}
