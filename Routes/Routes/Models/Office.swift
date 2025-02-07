//
//  Office.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import Foundation

struct Office: Codable {
    let id: Int
    let name: String
    let address: Address?
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zip: String
}
