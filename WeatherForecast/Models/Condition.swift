//
//  Condition.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import Foundation

struct Condition : Codable {
    
    let text : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }
    
}
