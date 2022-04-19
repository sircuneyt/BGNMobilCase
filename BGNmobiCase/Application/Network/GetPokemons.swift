//
//  GetPokemons.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import Alamofire
import AlamofireURLCache5

class GetPokemons {
    var limit: Int
    var offset: Int
    
    init(offset: Int, limit: Int) {
        self.offset = offset
        self.limit = limit
    }
    
    func execute(completion: @escaping (PokemonsModel?) -> ()) {
        let buildUrl =
        "\(NetworkConstant.BASE_URL)?offset=\(offset)&limit=\(limit)"
        let request = AF.request(buildUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        request.responseDecodable(of: PokemonsModel.self, completionHandler:  { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            })
            print(String(decoding: response.data ?? Data(), as: UTF8.self))
            guard let response = response.value else {
                return
            }
            completion(response)
        }) .cache(maxAge: 100)
    }
}
