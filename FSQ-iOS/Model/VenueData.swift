//
//  VenueModel.swift
//  FSQ-iOS
//
//  Created by Kyle Wiltshire on 11/15/19.
//  Copyright © 2019 Kyle Wiltshire. All rights reserved.
//

import Foundation

struct VenueData: Codable {
    let name: String
    let location: [VenueLocation];
}

struct VenueLocation: Codable {
    let address: String;
    let crossStreet: String;
    let lat: Double;
    let lng: Double;
    let distance: Int;
    let postalCode: String;
    let cc: String;
    let city: String;
    let country: String;
    let formattedAddress: [String]
}
