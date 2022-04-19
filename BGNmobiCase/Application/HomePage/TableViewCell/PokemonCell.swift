//
//  PokemonCell.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class PokemonCell: UITableViewCell {
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var showPoster: UIImageView!

    func configure(pokemons: Pokemons, indexPath: Int) {
        let number = indexPath + 1
        let url = "\(number).png"
        if let name = pokemons.name {
            pokemonName.text = name.capitalized
        }
        showPoster.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+url))
    }
}
