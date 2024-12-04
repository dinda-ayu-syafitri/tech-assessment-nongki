//
//  DependencyInjection.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

class DependencyInjection: ObservableObject {
    static let shared = DependencyInjection()

    private init() {}

    lazy var daerahRemoteDataSource = DaerahRemoteDataSource()
    lazy var daerahRepository = DaerahRepository(daerahRemoteDataSource: daerahRemoteDataSource)

    lazy var getAllProvinsiUseCase = GetAllProvinsiUseCaseImpl(daerahRepository: daerahRepository)
    lazy var getAllKotaUseCase = GetAllKotaUseCaseImpl(daerahRepository: daerahRepository)

    func inputViewModel() -> InputViewModel {
        InputViewModel(getAllProvinsiUseCase: getAllProvinsiUseCase, getAllKotaUseCase: getAllKotaUseCase)
    }
}
