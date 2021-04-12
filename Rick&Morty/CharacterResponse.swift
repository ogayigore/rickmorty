//
//  CharacterResponse.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 10.03.2021.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [Person]
    let info: Info
}
