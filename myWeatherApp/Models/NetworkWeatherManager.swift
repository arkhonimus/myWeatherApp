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
    var onCompletion: ((CurrentWeather) -> ())?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }
}
