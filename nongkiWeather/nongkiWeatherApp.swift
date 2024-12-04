//
//  nongkiWeatherApp.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftData
import SwiftUI

@main
struct nongkiWeatherApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: modelConfiguration)

            DependencyInjection.shared.initializer(modelContext: container.mainContext)

            return container
        } catch {
            fatalError("Error: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RouterView {
                InputView()
            }
            .modelContainer(sharedModelContainer)
        }
    }
}
