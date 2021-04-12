//
//  Person.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 03.03.2021.
//

import Foundation

struct Person: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: URL
    let origin: Location
//    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case image
        case origin
//        case location
    }
}
