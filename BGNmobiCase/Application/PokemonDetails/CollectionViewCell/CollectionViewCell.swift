//
//  collectionViewCell.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 18.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var moviePoster: UIImageView!

    func configure(image: String) {
            moviePoster.sd_setImage(with: URL(string: image))
    }
}
