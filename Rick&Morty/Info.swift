//
//  Info.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 16.03.2021.
//

import Foundation

struct Info: Decodable {
    let pages: Int
}

enum CodingKeys: String, CodingKey {
    case pages
}
