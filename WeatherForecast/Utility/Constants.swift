//
//  Constants.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import Foundation

struct WeatherForecast {
    static let apiKey = "4bb1085c5b2043e18c9103205241809"
    static let baseUrl = "https://api.weatherapi.com/v1/forecast.json"
    static let queryParamApiKey = "key"
    static let queryParamCityKey = "q"
    static let queryParamForecastKey = "days"
    static let forecastDays = "5"
    
    static let textFieldPlaceholder = "Enter City Name"
    static let searchButtonTitle = "Search"
    static let forecastLinkTitle = "Click to See Forecast"
    static let humidityText = "Humidity is"
    static let windSpeedText = "Wind Speed is"
    static let feelsLikeText = "Feels Like"

    static let cacheExpiryTime = 6


}
