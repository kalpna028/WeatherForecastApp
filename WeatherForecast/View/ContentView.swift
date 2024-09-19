//
//  ContentView.swift
//  WeatherForecast
//
//  Created by KalpnaMishra on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                MainHeaderView(viewModel: viewModel)
                TodayWeatherView(viewModel: viewModel)
            }
            .padding(.vertical, 20)
            .navigationBarTitle("Weather")
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
        }
        
    }
    
}

//#Preview {
//    ContentView()
//}
