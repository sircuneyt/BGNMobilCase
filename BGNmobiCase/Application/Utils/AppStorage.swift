//
//  AppStorage.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 20.04.2022.
//

import Foundation

class AppStorage {
    public static let userDefaults =  UserDefaults.standard
    
    static func writeAnyData(key: String, value: Any){
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func getAnyData(key: String) -> Any? {
        return userDefaults.value(forKey: key)
    }
    
    static func checkKey(key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
}


