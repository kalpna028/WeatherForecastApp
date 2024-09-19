//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import Foundation
import Alamofire

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var error: CustomError?
    var weatherService = WeatherAPIService(session: Session())

    
    init(weatherService:WeatherAPIService = WeatherAPIService(session: Session())) {
        self.weatherService = weatherService
    }


    func fetchWeather(forCity city: String) {
        weatherService.fetchWeather(forCity: city) { (weather, error)  in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.weather = weather
                    self.error = nil
                } else if let error = error {
                    self.error = error
                    self.weather = nil
                }
            }
        }
    }
}
