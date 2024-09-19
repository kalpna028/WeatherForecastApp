//
//  ForecastRowView.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import SwiftUI

struct ForecastRowView: View {
    var day: Forecastday
    
    var body: some View {
        HStack(spacing: 20) {
            Text(Utility().convertDateFormat(dateString: day.date ?? "") ?? "")
            Spacer()
            Text("\(day.day?.maxtemp_c ?? 0, specifier: "%.1f") °C / \(day.day?.mintemp_c ?? 0, specifier: "%.1f") °C")
        }
        .listRowBackground(Color.clear)
    }
}

//#Preview {
//    ForecastRowView()
//}
