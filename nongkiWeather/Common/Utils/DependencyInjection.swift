//
//  DependencyInjection.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation
import SwiftData

class DependencyInjection: ObservableObject {
    static let shared = DependencyInjection()

    private var modelContext: ModelContext?
    func initializer(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    private init() {}

    lazy var daerahRemoteDataSource = DaerahRemoteDataSource()
    lazy var daerahRepository = DaerahRepository(daerahRemoteDataSource: daerahRemoteDataSource)

    lazy var userLocalDataSource = UserLocalDataSource(modelContext: modelContext!)
    lazy var userRepository = UserRepository(userLocalDataSource: userLocalDataSource)

    lazy var getAllProvinsiUseCase = GetAllProvinsiUseCaseImpl(daerahRepository: daerahRepository)
    lazy var getAllKotaUseCase = GetAllKotaUseCaseImpl(daerahRepository: daerahRepository)

    lazy var getUserDataUseCase = GetUserDataUseCaseImpl(userRepository: userRepository)
    lazy var saveUserDataUseCase = SaveUserDataUseCaseImpl(userRepository: userRepository)

    func inputViewModel() -> InputViewModel {
        InputViewModel(getAllProvinsiUseCase: getAllProvinsiUseCase, getAllKotaUseCase: getAllKotaUseCase, getUserDataUseCase: getUserDataUseCase, saveUserDataUseCase: saveUserDataUseCase)
    }
}
