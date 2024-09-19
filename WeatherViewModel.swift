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
    private let weatherInfoStorageManager: WeatherInfoStorageManager

    init(weatherService:WeatherAPIService = WeatherAPIService(session: Session()), weatherInfoStorageManager: WeatherInfoStorageManager = WeatherInfoStorage()) {
        self.weatherService = weatherService
        self.weatherInfoStorageManager = weatherInfoStorageManager
    }
    
    func checkWeatherCache(forCity city: String) {
        let cachedWeather = weatherInfoStorageManager.getWeatherInfo(forCity: city)
        if let weather = cachedWeather, let savedDate = weather.timestamp {
            let interval = Calendar.current.dateComponents([.hour], from: savedDate, to: Date())
            
            if interval.hour ?? 0 >= 6 {
                makeAPICall(forCity: city)
            } else {
                //no api call needed
                DispatchQueue.main.async {
                    self.weather = weather
                    self.error = nil
                }
            }
        } else {
            //API call
            makeAPICall(forCity: city)
        }
    }
    
    

    func makeAPICall(forCity city: String) {
        weatherService.fetchWeather(forCity: city) { (weather, error)  in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.weatherInfoStorageManager.cacheWeatherInfo(weather: weather)
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
