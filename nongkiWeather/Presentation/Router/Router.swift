//
//  Router.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path: [RouteEnum] = .init()

    @ViewBuilder func view(for route: RouteEnum) -> some View {
        switch route {
        case .inputPage:
            ContentView()
        case .weatherPage:
            ContentView()
        default:
            ContentView()
        }
    }

    func navigateTo(_ route: RouteEnum, clear: Bool = false) {
        path.append(route)
        if clear {
            path.removeAll { $0 != route }
        }
    }

    func navigateBack() {
        if path.count != 0 {
            path.removeLast()
        }
    }

    func popToRoot() {
        path.removeAll()
    }
}
