//
//  RouterView.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = .init()
    private let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: RouteEnum.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}
