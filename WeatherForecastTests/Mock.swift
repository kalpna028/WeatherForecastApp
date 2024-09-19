//
//  Mock.swift
//  WeatherForecastTests
//
//  Created by KalpnaMishra on 18/09/24.
//

import Foundation
@testable import WeatherForecast
import Alamofire

let location = Location(name: "", region: "", country: "", lat: 1.0, lon: 1.0, tz_id: "", localtime_epoch: 1, localtime: "")
let current = Current(temp_c: 2.0, condition: nil, wind_mph: 2.0, wind_kph: 2.0, humidity: 23, cloud: 1, feelslike_c: 12.2)
let forecast = Forecast(forecastDay: [])
var weather = Weather(location: location, current: current, forecast: forecast, timestamp: Date())


class MockResponse {
    let sampleURL = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=4bb1085c5b2043e18c9103205241809&q=Delhi&days=5")
    
    func getSuccessResponseResult() -> Result<Data, AFError> {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(weather)
        
        let result = Result<Data, AFError>.success(jsonData)
        return result
    }
    
    func getErrorResponseResult() -> Result<Data, AFError> {
        let result = Result<Data, AFError>.failure(.responseValidationFailed(reason: .unacceptableStatusCode(code: 101)))
        return result
    }
}




class MockSession: Session {
    var isForSuccess = true
}


class MockWeatherAPIService: WeatherAPIService {
    
    var isForSuccess = true
    var isFetchWeatherCalled = false
    override func fetchWeather(forCity city: String, completion: @escaping (Weather?, CustomError?) -> Void) {
        isFetchWeatherCalled = true

        if isForSuccess {
            completion(weather, nil)
        } else {
            completion(nil, CustomError(errorCode: 101, errorMsg: "Something Went Wrong"))
        }
    }
    
}

class MockWeatherInfoStorageManager : WeatherInfoStorageManager {
   
    var isCacheAvailable = true
    var isForExpiredCache = false
    
    func cacheWeatherInfo(weather: Weather) {
        
    }
    
    
    
    func getWeatherInfo(forCity city: String) -> Weather? {
        
        if isForExpiredCache {
            let earlyDate = Calendar.current.date(
              byAdding: .hour,
              value: -7,
              to: Date())
            weather.timestamp = earlyDate
        }
        return isCacheAvailable ? weather : nil
    }
    
    
    
    
}
