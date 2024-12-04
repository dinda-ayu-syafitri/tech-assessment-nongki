//
//  DaerahRemoteDataSource.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import Foundation

class DaerahRemoteDataSource: DaerahRemoteDataSourceProtocol {
    func getKotaLatLong(kota: String) async throws -> KotaLatLong {
        guard let encodedKota = kota.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw DaerahError.invalidURL
        }

        let endpoint = "https://api.openweathermap.org/geo/1.0/direct?q=\(encodedKota)&limit=1&appid=8a8363c14ccb90e468eb6fb34bf41d2a"

        guard let url = URL(string: endpoint) else { throw DaerahError.invalidURL }
        let (value, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw DaerahError.invalidResponse }

        do {
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode([KotaLatLong].self, from: value)

            if apiResponse.isEmpty {
                print("No data found")
                throw DaerahError.noData
            } else {
                return apiResponse.first ?? KotaLatLong(lat: 0, lon: 0)
            }
        } catch {
            print("Decoding failed with error:", error)
            throw DaerahError.invalidData
        }
    }

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

    func getAllKota(idProvinsi: String) async throws -> [Kota] {
        let endpoint = "https://api.binderbyte.com/wilayah/kabupaten?api_key=89df9fc43e242aa6ef9caa1009adcb12dd49ddaad0d128cf5f9a3f160c1e7206&id_provinsi=\(idProvinsi)"

        guard let url = URL(string: endpoint) else { throw DaerahError.invalidURL }

        let (value, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw DaerahError.invalidResponse }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let apiResponse = try decoder.decode(APIResponse<[Kota]>.self, from: value)
            return apiResponse.value
        } catch {
            print("Decoding failed with error:", error)
            throw DaerahError.invalidData
        }
    }
}
