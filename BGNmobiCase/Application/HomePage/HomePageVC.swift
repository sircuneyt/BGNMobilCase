//
//  HomePageVC.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import UIKit
import RxSwift
import FirebaseRemoteConfig

class HomePageVC: UIViewController {
    let viewModel = HomePageVM()

    override func viewWillAppear(_ animated: Bool) {
        viewModel.pokemonModel.accept(viewModel.pokemonModel.value)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Pokemons"
    }
    
    @IBOutlet weak var tableViewContent: ContentSizedTableView! {
        didSet {
            tableViewContent.register(UINib(nibName: "PokemonCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
            viewModel.pokemonModel.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] status in
                self?.tableViewContent.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemonModel.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resultCell: PokemonCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonCell , let pokemons =  self.viewModel.pokemonModel.value?[indexPath.row] else {
            return UITableViewCell()
        }
        resultCell.configure(pokemons: pokemons, indexPath: indexPath.row)
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 10 == self.viewModel.pokemonModel.value?.count {
            viewModel.getData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pokemon = viewModel.pokemonModel.value?[indexPath.row] , let url = pokemon.url else { return }
        let detailPage = PokemonDetailsVC()
        detailPage.viewModel.getPokemonDetails(url: url)
        self.navigationController?.pushViewController(detailPage, animated: true)
    }
}



