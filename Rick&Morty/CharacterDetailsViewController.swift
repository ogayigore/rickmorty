//
//  CharacterDetailsViewController.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 19.03.2021.
//

import UIKit
import Kingfisher

class CharacterDetailsViewController: UIViewController {
    
    var character: Person?
    
    lazy var characterImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var status: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var species: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var type: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gender: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var origin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        view.backgroundColor = .systemBackground
    }
    
    func setUpUI() {
        navigationItem.title = "\(character!.name)"
        
        characterImage.kf.setImage(with: character!.image)
        statusLabel.text = "Status:"
        status.text = character?.status
        speciesLabel.text = "Species:"
        species.text = character?.species
        typeLabel.text = "Type:"
        type.text = character?.type
        genderLabel.text = "Gender:"
        gender.text = character?.gender
        originLabel.text = "Origin"
        origin.text = character?.origin.name
        
        view.addSubview(characterImage)
        characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        characterImage.heightAnchor.constraint(equalTo: characterImage.widthAnchor).isActive = true
        
        view.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(status)
        status.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor).isActive = true
        status.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        view.addSubview(speciesLabel)
        speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8).isActive = true
        speciesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(species)
        species.centerYAnchor.constraint(equalTo: speciesLabel.centerYAnchor).isActive = true
        species.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        view.addSubview(typeLabel)
        typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 8).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(type)
        type.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor).isActive = true
        type.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        view.addSubview(genderLabel)
        genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(gender)
        gender.centerYAnchor.constraint(equalTo: genderLabel.centerYAnchor).isActive = true
        gender.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        view.addSubview(originLabel)
        originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8).isActive = true
        originLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(origin)
        origin.centerYAnchor.constraint(equalTo: originLabel.centerYAnchor).isActive = true
        origin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
        
}
