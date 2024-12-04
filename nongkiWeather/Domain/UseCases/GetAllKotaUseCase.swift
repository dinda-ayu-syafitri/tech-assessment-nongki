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
    private let daerahRepository: DaerahRepository

    init(daerahRepository: DaerahRepository) {
        self.daerahRepository = daerahRepository
    }

    func execute(idProvinsi: String) async throws -> [Kota] {
        let kota = try await daerahRepository.getAllKota(idProvinsi: idProvinsi)

        return kota
    }
}
