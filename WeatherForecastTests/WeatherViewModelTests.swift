//
//  WeatherViewModelTests.swift
//  WeatherForecastTests
//
//  Created by KalpnaMishra on 18/09/24.
//

import XCTest
@testable import WeatherForecast

final class WeatherViewModelTests: XCTestCase {

    func testForFetchWeatherSuccessCase() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService)
        
        weatherViewModel.fetchWeather(forCity: "Delhi")
        let exp = expectation(description: "Fetching Data")
        exp.fulfill()

        waitForExpectations(timeout: 2)
        
        XCTAssertNotNil(weatherViewModel.weather)
        XCTAssertNil(weatherViewModel.error)
    }

}
