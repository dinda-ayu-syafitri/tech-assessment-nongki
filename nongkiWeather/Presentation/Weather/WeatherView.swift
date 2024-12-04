//
//  WeatherView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Selamat Siang")
                Text("Bambang")
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
    }
}

#Preview {
    WeatherView()
}
