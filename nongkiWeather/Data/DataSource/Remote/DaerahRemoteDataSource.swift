//
//  DaerahRemoteDataSource.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import Foundation

class DaerahRemoteDataSource: DaerahRemoteDataSourceProtocol {
    func getAllProvinsi() async throws -> [Provinsi] {
        let endpoint = "https://api.binderbyte.com/wilayah/provinsi?api_key=89df9fc43e242aa6ef9caa1009adcb12dd49ddaad0d128cf5f9a3f160c1e7206"

        guard let url = URL(string: endpoint) else { throw DaerahError.invalidURL }

        let (value, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw DaerahError.invalidResponse }

        do {
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(APIResponse<[Provinsi]>.self, from: value)
            return apiResponse.value
        } catch {
            print("Decoding failed with error:", error)
            throw DaerahError.invalidData
        }
    }

    func getAllKota() async throws -> [Kota] {
        return []
    }
}
