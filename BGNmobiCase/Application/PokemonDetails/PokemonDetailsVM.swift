//
//  PokemonDetailsVM.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import RxSwift
import RxCocoa
import FirebaseAnalytics

class PokemonDetailsVM {
    let disposeBag = DisposeBag()
    let pokemonModel = BehaviorRelay<PokemonDetails?>(value: nil) 
    
    func getPokemonDetails(url: String) {
        GetPokemonDetails(url: url).execute { [weak self] data in
            data?.sprites?.getImages()
            self?.pokemonModel.accept(data)
        }
    }
    
    func sendFirebaseEvent(key: String, parameters: [String: Any]? = nil) {
        Analytics.logEvent(key, parameters: parameters)
    }
}
