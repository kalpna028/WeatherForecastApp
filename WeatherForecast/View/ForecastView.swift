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
        VStack{
            Text("\(viewModel.weather?.location?.name ?? "")'s 5 days Forecast").font(.title).fontWeight(.bold)
            List(viewModel.weather?.forecast?.forecastday ?? [], id: \.date_epoch) { day in
                ForecastRowView(day: day)
            }
        }
        .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
        .scrollContentBackground(.hidden)
        
        
    }
}

//#Preview {
//    ForecastView(viewModel: WeatherViewModel())
//}
