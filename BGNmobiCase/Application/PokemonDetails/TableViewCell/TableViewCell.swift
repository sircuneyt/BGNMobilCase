//
//  tableViewCell.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 18.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    @IBOutlet weak var statName: UILabel! 
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var base_stat: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func configure(stat: Stats) {
        let name = stat.stat?.name
        switch name {
        case "hp":
            icon.image = UIImage(named: "hp")
        case "attack":
            icon.image = UIImage(named: "attack")
        case "defense":
            icon.image = UIImage(named: "defense")
        case "special-attack":
            icon.image = UIImage(named: "special-attack")
        case "special-defense":
            icon.image = UIImage(named: "special-defense")
        case "speed":
            icon.image = UIImage(named: "speed")
        default:
            icon.image = nil
        }
        statName.text = stat.stat?.name
        base_stat.text = "\(stat.base_stat ?? 0.0)"
        progressView.progress = (stat.base_stat ?? 0.0 ) / 100
        progressView.progressTintColor = UIColor.red
        
    }
}
