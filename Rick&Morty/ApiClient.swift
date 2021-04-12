//
//  ApiClient.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 03.03.2021.
//

import Foundation

class ApiClientImpl {
    func get(characters: @escaping ([Person]) -> Void, totalPages: @escaping (Info) -> Void, currentPage: Int) {
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(currentPage)")!
        print(url)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
//                print("response - \(response.results)")
                characters(response.results)
                totalPages(response.info)
                
            } catch {
                print("error - \(error)")
                characters([])
            }
        }
        session.resume()
    }
    
    func get(location: @escaping ([Location]) -> Void, totalPages: @escaping (Info) -> Void, currentPage: Int) {
        let url = URL(string: "https://rickandmortyapi.com/api/location/?page=\(currentPage)")!
        print(url)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(LocationResponse.self, from: data)
//                print("response - \(response.results)")
                location(response.results)
                totalPages(response.info)
                
            } catch {
                print("error - \(error)")
                location([])
            }
        }
        session.resume()
    }
}
