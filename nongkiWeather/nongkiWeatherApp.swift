//
//  nongkiWeatherApp.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

@main
struct nongkiWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                InputView()
            }
        }
    }
}
