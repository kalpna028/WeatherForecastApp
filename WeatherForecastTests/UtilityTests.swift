//
//  UtilityTests.swift
//  WeatherForecastTests
//
//  Created by KalpnaMishra on 18/09/24.
//

import XCTest
@testable import WeatherForecast


final class UtilityTests: XCTestCase {

    func testForURLBuilderWithCity() {
        let finalURL = Utility().urlBuilder(city: "Delhi")
        XCTAssertEqual(finalURL?.absoluteString, "https://api.weatherapi.com/v1/forecast.json?key=4bb1085c5b2043e18c9103205241809&q=Delhi&days=5")
    }
    
    func testForDateFormatterWithCorrectInputFormat() {
        let convertedDate = Utility().convertDateFormat(dateString: "2024-09-18")
        XCTAssertEqual(convertedDate, "18 Sep")
    }
    
    func testForDateFormatterWithInCorrectInputFormat() {
        let convertedDate = Utility().convertDateFormat(dateString: "2024-18-09")
        XCTAssertEqual(convertedDate, nil)
    }

}
