//
//  WeatherViewModel.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let getUserDataUseCase: GetUserDataUseCase

    init(getUserDataUseCase: GetUserDataUseCase) {
        self.getUserDataUseCase = getUserDataUseCase
    }

    @Published var userName = ""

    func getUserData() {
        do {
            if let user = try getUserDataUseCase.execute() {
                userName = user.name
            }
        } catch {
            print("Error fetching user data: \(error)")
        }
    }
}
