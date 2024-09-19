//
//  TodayWeatherView.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            if let currentModel = self.viewModel.weather?.current {
                Text("\(currentModel.condition?.text ?? "")").fontWeight(.medium)
                Text("\(currentModel.temp_c ?? 0, specifier: "%.1f") °C").fontWeight(.bold)
                Text("\(WeatherForecast.feelsLikeText)  \(currentModel.feelslike_c ?? 0, specifier: "%.1f") °C").fontWeight(.medium)
                Text("\(WeatherForecast.humidityText)  \(currentModel.humidity ?? 0)").fontWeight(.medium)
                Text("\(WeatherForecast.windSpeedText)  \(currentModel.wind_kph ?? 0, specifier: "%.1f")").fontWeight(.medium)
                
                Spacer()
                
                NavigationLink(WeatherForecast.forecastLinkTitle) {
                    ForecastView(viewModel: viewModel)
                }
            } else if let error = self.viewModel.error {
                ErrorView(viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    TodayWeatherView()
//}
