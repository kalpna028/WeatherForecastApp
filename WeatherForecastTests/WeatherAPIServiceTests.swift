//
//  WeatherAPIServiceTests.swift
//  WeatherForecastTests
//
//  Created by KalpnaMishra on 18/09/24.
//

import XCTest
import Alamofire
@testable import WeatherForecast

final class WeatherAPIServiceTests: XCTestCase {
    
    func testForResponseParsingSuccessCase() {
        let response = DataResponse(request: URLRequest(url: MockResponse().sampleURL!), response: HTTPURLResponse(), data: Data(), metrics: URLSessionTaskMetrics(), serializationDuration: 1, result: MockResponse().getSuccessResponseResult())

        let apiService = WeatherAPIService(session: MockSession())
        
        let finalResult = apiService.parseResponse(response: response)
        XCTAssertNil(finalResult.1)
        XCTAssertNotNil(finalResult.0)
        
    }
    
    func testForResponseParsingErrorCaseWithBlankData() {
        let response = DataResponse(request: URLRequest(url: MockResponse().sampleURL!), response: HTTPURLResponse(), data: Data(), metrics: URLSessionTaskMetrics(), serializationDuration: 1, result: MockResponse().getErrorResponseResult())

        let apiService = WeatherAPIService(session: MockSession())
        
        let finalResult = apiService.parseResponse(response: response)
        XCTAssertNil(finalResult.0)
        XCTAssertNotNil(finalResult.1)
        
    }

}
