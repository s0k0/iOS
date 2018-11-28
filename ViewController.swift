//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sophie Kolbe on 13.11.18.
//  Copyright © 2018 Sophie Kolbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let weatherClient = WeatherClient()
    @IBOutlet weak var weatherDescrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       loadWeatherData()
    }
    
    func loadWeatherData() {
        weatherClient.loadWeatherData(onCompletion: { [weak self] cityName in
            DispatchQueue.main.async {
                self?.weatherDescrLabel.text = "Hello, " + cityName
            }
        })
    }

}

