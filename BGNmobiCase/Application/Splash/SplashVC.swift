//
//  SplashVC.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 19.04.2022.
//

import Foundation
import UIKit
import FirebaseRemoteConfig

class SplashVC: UIViewController {
    @IBOutlet weak var lblFirmName: UILabel!
        
        override func viewDidLoad() {
           setDefaultValues()
           getRemoteConfig()
           startApp()
        }
        
        private func setDefaultValues(){
            let defaultValue = ["projectName": "CA" as NSObject]
            remoteConfig.setDefaults(defaultValue)
        }
        
        private func getRemoteConfig(){
            remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
                guard error == nil else { return }
                remoteConfig.activate()
                lblFirmName.text = remoteConfig.configValue(forKey: "projectName").stringValue
            }
        }
        
        private func startApp(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomePageVC") as? HomePageVC
                self.navigationController?.pushViewController(vc!, animated: true)            })
        }
}
