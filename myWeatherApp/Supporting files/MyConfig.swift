//
//  MyConfig.swift
//  myWeatherApp
//
//  Created by Владислав Клепиков on 21.04.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import Foundation

final class MyConfig {
    static let shared = MyConfig()
    
    private let apiKey: String = "ce804bdb83a3b31066a3d5d20b146d32"
    
    private init(){}
    
    func getApiKey() -> String {
        return apiKey
    }
}
