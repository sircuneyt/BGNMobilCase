//
//  tableViewCell.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 18.04.2022.
//

import Foundation
import UIKit
import SDWebImage
import Localize_Swift

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
            statName.text = "hp".localized()
        case "attack":
            icon.image = UIImage(named: "attack")
            statName.text = "attack".localized()
        case "defense":
            icon.image = UIImage(named: "defense")
            statName.text = "defense".localized()
        case "special-attack":
            icon.image = UIImage(named: "special-attack")
            statName.text = "special-attack".localized()
        case "special-defense":
            icon.image = UIImage(named: "special-defense")
            statName.text = "special-defense".localized()
        case "speed":
            icon.image = UIImage(named: "speed")
            statName.text = "speed".localized()
        default:
            icon.image = nil
        }
        base_stat.text = "\(stat.base_stat ?? 0.0)"
        progressView.progress = (stat.base_stat ?? 0.0 ) / 100
        progressView.progressTintColor = UIColor.red
        
    }
}
