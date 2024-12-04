//
//  InputViewModel.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

class InputViewModel: ObservableObject {
    private let getAllProvinsiUseCase: GetAllProvinsiUseCase
    private let getAllKotaUseCase: GetAllKotaUseCase

    init(getAllProvinsiUseCase: GetAllProvinsiUseCase, getAllKotaUseCase: GetAllKotaUseCase) {
        self.getAllProvinsiUseCase = getAllProvinsiUseCase
        self.getAllKotaUseCase = getAllKotaUseCase
    }

    @Published var provinsi: [Provinsi] = []
    @Published var kota: [Kota] = []

    func getProvinsi() async throws {
        do {
            provinsi = try await getAllProvinsiUseCase.execute()
        } catch DaerahError.invalidURL {
            print("Invalid URL", Error.self)
            throw DaerahError.invalidURL
        } catch DaerahError.invalidResponse {
            print("Invalid Response", Error.self)
            throw DaerahError.invalidResponse
        } catch DaerahError.invalidData {
            print("Invalid Data", Error.self)
            throw DaerahError.invalidData
        }
    }

    func getKota(idProvinsi: String) async throws {
        do {
            kota = try await getAllKotaUseCase.execute(idProvinsi: idProvinsi)
        } catch DaerahError.invalidURL {
            print("Invalid URL", Error.self)
            throw DaerahError.invalidURL
        } catch DaerahError.invalidResponse {
            print("Invalid Response", Error.self)
            throw DaerahError.invalidResponse
        } catch DaerahError.invalidData {
            print("Invalid Data", Error.self)
            throw DaerahError.invalidData
        }
    }
}
