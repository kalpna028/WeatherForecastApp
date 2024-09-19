//
//  WeatherInfoStorage.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 19/09/24.
//

import Foundation

protocol WeatherInfoStorageManager {
    func cacheWeatherInfo(weather: Weather)
    func getWeatherInfo(forCity city: String) -> Weather?
}

class WeatherInfoStorage : WeatherInfoStorageManager {
    
    private var userDefaults = UserDefaults.standard
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func cacheWeatherInfo(weather: Weather) {
        let encoder = JSONEncoder()
        
        var newWeather = weather
        newWeather.timestamp = Date()
        
        if let encoded = try? encoder.encode(newWeather) {
            userDefaults.set(encoded, forKey: newWeather.location?.name ?? "")
        }
    }
    
    func getWeatherInfo(forCity city: String) -> Weather? {
        let decoder = JSONDecoder()
        
        if let cachedWeather = userDefaults.data(forKey: city) {
            if let cachedWeatherInfo = try? decoder.decode(Weather.self, from: cachedWeather) {
                return cachedWeatherInfo
            }
        }
        return nil
    }
    
    
}
