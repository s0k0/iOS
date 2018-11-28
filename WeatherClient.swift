//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by Sophie Kolbe on 14.11.18.
//  Copyright © 2018 Sophie Kolbe. All rights reserved.
//

import Foundation

class WeatherClient {
    
    static let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=Berlin&APPID=f3871a3f14d138f70291404a3882593e"
    
    func loadWeatherData(onCompletion: @escaping (_ cityName: String) -> Void) {

        guard let url = URL(string: WeatherClient.weatherURL) else {
            return
        }
    
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data else {
                   //no data
                    return
            }
            guard let weatherObj = try? JSONDecoder().decode(WeatherNetworkResponse.self, from: dataResponse) else {
                //couldn#t parse
                return
            }
          
            print(weatherObj)
            onCompletion(weatherObj.name)
        }
        task.resume()
    }
}
