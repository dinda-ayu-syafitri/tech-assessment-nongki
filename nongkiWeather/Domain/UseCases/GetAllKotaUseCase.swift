//
//  GetAllKotaUseCase.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol GetAllKotaUseCase {
    func execute(idProvinsi: String) async throws -> [Kota]
}

class GetAllKotaUseCaseImpl: GetAllKotaUseCase {
    private let DaerahRepository: DaerahRepository

    init(DaerahRepository: DaerahRepository) {
        self.DaerahRepository = DaerahRepository
    }

    func execute(idProvinsi: String) async throws -> [Kota] {
        let kota = try await DaerahRepository.getAllKota(idProvinsi: idProvinsi)

        return kota
    }
}
