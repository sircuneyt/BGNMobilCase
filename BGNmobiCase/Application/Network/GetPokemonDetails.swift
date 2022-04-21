//
//  GetPokemonDetails.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation
import Alamofire
import AlamofireURLCache5

class GetPokemonDetails {
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func execute(completion: @escaping (PokemonDetails?) -> ()) {
        
        let buildUrl = "\(url)"
        if AppStorage.checkKey(key: buildUrl) == true,  let cachedResponse = AppStorage.getAnyData(key: buildUrl) ,let data = cachedResponse as? Data {
            
            do {
                let object = try JSONDecoder().decode(PokemonDetails.self, from: data)
                completion(object)
            }
            catch {
                return
            }
        } else {
            let request = AF.request(buildUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            
            request.responseDecodable(of: PokemonDetails.self, completionHandler:  { (response) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                })
                print(String(decoding: response.data ?? Data(), as: UTF8.self))
                if response.data != nil {
                    AppStorage.writeAnyData(key: buildUrl, value: response.data)
                    
                }
                guard let response = response.value else {
                    return
                }
                completion(response)
            }) .cache(maxAge: 100)
        }
    }
}
