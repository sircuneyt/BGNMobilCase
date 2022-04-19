//
//  HomePageVM.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import RxCocoa
import RxSwift
import FirebaseAnalytics

class HomePageVM {
    let disposeBag = DisposeBag()
    let pokemonModel = BehaviorRelay<[Pokemons?]?>(value: nil)
    let offset = BehaviorRelay<Int>(value: 0)
    let limit = 20 // default : 20
    let lazyLoad = BehaviorRelay<Bool>(value: false)
 
    init() {
        getData()
    }
    
    func getData() {
        if lazyLoad.value == false {
            lazyLoad.accept(true)
            GetPokemons(offset: offset.value, limit: limit) .execute { [weak self] data in
                if self?.offset.value != 0 {
                    var newList = self?.pokemonModel.value
                    newList?.append(contentsOf: data?.results ?? [])
                    self?.pokemonModel.accept(newList)
                } else {
                    self?.pokemonModel.accept(data?.results)
                }
                self?.offset.accept((self?.offset.value ?? 0) + (self?.limit ?? 20))
                self?.lazyLoad.accept(false)
            }
        }
    }
}
