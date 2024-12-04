//
//  GetKotaLatLonUseCase.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol GetKotaLatLonUseCase {
    func execute(kota: String) async throws -> KotaLatLong
}

class GetKotaLatLonUseCaseImpl: GetKotaLatLonUseCase {
    private let daerahRepository: DaerahRepository

    init(daerahRepository: DaerahRepository) {
        self.daerahRepository = daerahRepository
    }

    func execute(kota: String) async throws -> KotaLatLong {
        let kotaData = try await daerahRepository.getKotaLatLong(kota: kota)
        return kotaData
    }
}
