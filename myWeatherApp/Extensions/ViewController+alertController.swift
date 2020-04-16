//
//  ViewController+alertController.swift
//  myWeatherApp
//
//  Created by Владислав Клепиков on 16.04.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        
        let AC = UIAlertController(title: title, message: message, preferredStyle: style)
        AC.addTextField { (textField) in
            let cities = ["Samara", "Ufa", "Moscow"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { (action) in
            let textField = AC.textFields?.first
            
            guard let cityName = textField?.text else { return }
            
            if cityName != "" {
//                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        AC.addAction(search)
        AC.addAction(cancel)
        present(AC, animated: true, completion: nil)
    }
}
