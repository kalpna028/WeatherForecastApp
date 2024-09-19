//
//  Utility.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import Foundation

class Utility {
    func convertDateFormat(dateString : String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return nil }
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }

    func urlBuilder(city: String) -> URL? {
        var url = URL(string: WeatherForecast.baseUrl)
        url?.append(queryItems: [
            URLQueryItem(name: WeatherForecast.queryParamApiKey, value: WeatherForecast.apiKey),
            URLQueryItem(name: WeatherForecast.queryParamCityKey, value: city),
            URLQueryItem(name: WeatherForecast.queryParamForecastKey, value: WeatherForecast.forecastDays)
        ])
        return url
    }
}


