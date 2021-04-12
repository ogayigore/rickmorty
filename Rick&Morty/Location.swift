//
//  Location.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 19.03.2021.
//

import Foundation

struct Location: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
