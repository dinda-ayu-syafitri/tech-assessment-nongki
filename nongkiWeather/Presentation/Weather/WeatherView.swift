//
//  WeatherView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var vm = DependencyInjection.shared.weatherViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Selamat Siang")
                Text("\(vm.userName)")
            }

            VStack(alignment: .leading) {
                Text("Cuaca hari ini")
                HStack {
                    Text("Tangerang")
                    Text("30 C")
                    Text("Cerah")
                }
            }

            VStack(alignment: .leading) {
                HStack {
                    Text("20/10/2024")
                    Text("20/10/2024")
                    Text("Tangerang")
                    Text("30 C")
                    Text("Cerah")
                }
            }
        }
        .onAppear(perform: {
            vm.getUserData()
        })
    }
}

#Preview {
    WeatherView()
}
