//
//  NetworkWeatherManager.swift
//  myWeatherApp
//
//  Created by Владислав Клепиков on 17.04.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

struct NetworkWeatherManager {
    let apiKey = MyConfig.shared.getApiKey()
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.parseJSON(withData: data)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWeatherData.main.temp)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
    }
}
