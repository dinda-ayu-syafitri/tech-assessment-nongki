//
//  GetAllProvinsiUseCase.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol GetAllProvinsiUseCase {
    func execute() async throws -> [Provinsi]
}

class GetAllProvinsiUseCaseImpl: GetAllProvinsiUseCase {
    private let DaerahRepository: DaerahRepository

    init(DaerahRepository: DaerahRepository) {
        self.DaerahRepository = DaerahRepository
    }

    func execute() async throws -> [Provinsi] {
        let provinsi = try await DaerahRepository.getAllProvinsi()

        return provinsi
    }
}
