//
//  ForecastView.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView{
            List(viewModel.weather?.forecast?.forecastday ?? [], id: \.date_epoch) { day in
                ForecastRowView(day: day)
            }
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
            
        }
        
    }
}

//#Preview {
//    ForecastView(viewModel: WeatherViewModel())
//}
