//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Igor Ogai on 12.03.2021.
//

import UIKit

class CharacterCell: UITableViewCell {
    static var cell = "cell"
    
    lazy var characterImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    func setUpViews() {
        addSubview(characterImage)
        addSubview(nameLabel)
        
        characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        characterImage.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

