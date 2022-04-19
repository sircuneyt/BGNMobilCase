//
//  PokemonDetailsVC.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//
import UIKit
import RxSwift
import RxCocoa
import FirebaseAnalytics

class PokemonDetailsVC: UIViewController {
    let viewModel = PokemonDetailsVM()
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        viewModel.pokemonModel.accept(viewModel.pokemonModel.value)
    }
    
    @IBOutlet weak var collectionViewContent: ContentSizedCollectionView! {
        didSet {
            collectionViewContent.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
            viewModel.pokemonModel.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] status in
                self?.collectionViewContent.reloadData()
            }).disposed(by: viewModel.disposeBag)
            }
    }
 
    @IBOutlet weak var tableViewContent: ContentSizedTableView! {
        didSet {
            tableViewContent.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
            viewModel.pokemonModel.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] status in
                self?.navigationItem.title = status?.name.capitalized ?? ""
                self?.tableViewContent.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
}

extension PokemonDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pokemonModel.value?.stats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resultCell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell, let stat = self.viewModel.pokemonModel.value?.stats?[indexPath.row] else {
            return UITableViewCell()
        }
        resultCell.configure(stat: stat)
        return resultCell
    }
}

extension PokemonDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonModel.value?.sprites?.imageArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let resultCell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell, let image = viewModel.pokemonModel.value?.sprites?.imageArray[indexPath.row] else {
            return UICollectionViewCell()
        }
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: "PokemonDetail",
                                                                  AnalyticsParameterScreenClass: PokemonDetailsVC.self])
             Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                AnalyticsParameterItemName: "Name: \(self.viewModel.pokemonModel.value?.name ?? "")"
                 ])
        self.viewModel.sendFirebaseEvent(key: "pokemonDetail", parameters: [
            "PokemonName" : self.viewModel.pokemonModel.value?.name ?? 0,
        ])
        resultCell.configure(image: image)
        return resultCell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/5 , height: collectionView.frame.size.height/4)
    }
}







