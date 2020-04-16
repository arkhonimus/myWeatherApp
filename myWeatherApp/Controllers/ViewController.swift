//
//  ViewController.swift
//  myWeatherApp
//
//  Created by Владислав Клепиков on 16.04.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Введите название города", message: nil, style: .alert)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

