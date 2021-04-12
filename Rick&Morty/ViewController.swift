//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 01.02.2021.
//

import Kingfisher
import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {
    
    private var apiClient = ApiClientImpl()
    
    var characters = [Person]()
    var filteredCharacters = [Person]()
    
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var currentPage = 1
    var totalPages = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        apiClient.get(characters: { (result) in
            self.characters = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, totalPages: { (totalPages)  in
            self.totalPages = totalPages.pages
            print(totalPages)
        }, currentPage: currentPage)
        
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.cell)
                
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.keyboardDismissMode = .onDrag
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling =  false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
    }
    
}

// MARK: - TableView DataSource & Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCharacters.count
        }
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.cell, for: indexPath) as! CharacterCell
        
        if searchController.isActive {
            cell.characterImage.kf.setImage(with: filteredCharacters[indexPath.row].image)
            cell.nameLabel.text = filteredCharacters[indexPath.row].name
        } else {
            cell.characterImage.kf.setImage(with: characters[indexPath.row].image)
            cell.nameLabel.text = characters[indexPath.row].name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentPage < totalPages && indexPath.row == characters.count - 1 {
            currentPage += 1
            apiClient.get(characters: { (person) in
                self.characters.append(contentsOf: person)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }, totalPages: { (totalPages)  in
                self.totalPages = totalPages.pages
            }, currentPage: currentPage)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let characterDetailsViewController = CharacterDetailsViewController()
        let character = characters[indexPath.row]
        characterDetailsViewController.character = character
        
        
        self.navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
    
}

// MARK: - SearchBar
extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        filterForSearchText(searchText: searchText)
    }
    
    func filterForSearchText(searchText: String) {
        filteredCharacters = characters.filter {
            char in
            if searchController.searchBar.text != "" {
                let searchTextMatch = char.name.lowercased().contains(searchText.lowercased())
                
                return searchTextMatch
            } else {
                return true
            }
        }
        tableView.reloadData()
    }
    
}
