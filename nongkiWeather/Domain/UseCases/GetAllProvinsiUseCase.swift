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
    private let daerahRepository: DaerahRepository

    init(daerahRepository: DaerahRepository) {
        self.daerahRepository = daerahRepository
    }

    func execute() async throws -> [Provinsi] {
        let provinsi = try await daerahRepository.getAllProvinsi()
        return provinsi
    }
}
