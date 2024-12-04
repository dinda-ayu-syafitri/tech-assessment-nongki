//
//  DaerahRepository.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

class DaerahRepository: DaerahRepositoryProtocol {
    private let daerahRemoteDataSource: DaerahRemoteDataSourceProtocol

    init(daerahRemoteDataSource: DaerahRemoteDataSourceProtocol) {
        self.daerahRemoteDataSource = daerahRemoteDataSource
    }

    func getAllProvinsi() async throws -> [Provinsi] {
        let remoteProvinsiData = try await daerahRemoteDataSource.getAllProvinsi()
        return remoteProvinsiData
    }

    func getAllKota(idProvinsi: String) async throws -> [Kota] {
        let remoteKotaData = try await daerahRemoteDataSource.getAllKota(idProvinsi: idProvinsi)
        return remoteKotaData
    }
}
