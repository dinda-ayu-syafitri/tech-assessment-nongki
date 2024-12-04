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

    @Published var name: String = ""
    @Published var provinsi: [Provinsi] = []
    @Published var kota: [Kota] = []
    @Published var selectedProvinsi: Provinsi?
    @Published var selectedKota: Kota?

    func getProvinsi() async throws {
        do {
            let provinsiData = try await getAllProvinsiUseCase.execute()
            var newProv: [Provinsi] = []
            for p in provinsiData {
                newProv.append(p)
            }
            provinsi = newProv
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
            let kotaData = try await getAllKotaUseCase.execute(idProvinsi: idProvinsi)
            var newKota: [Kota] = []
            for k in kotaData {
                newKota.append(k)
            }
            kota = newKota
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
