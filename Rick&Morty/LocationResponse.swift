//
//  LocationResponse.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 19.03.2021.
//

import Foundation

struct LocationResponse: Decodable {
    let results: [Location]
    let info: Info
}
