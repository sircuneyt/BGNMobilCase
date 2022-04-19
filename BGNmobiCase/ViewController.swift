//
//  ViewController.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GetPokemons(offset: 0, limit: 20).execute { [weak self] data in
        }
    }


}

