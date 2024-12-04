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
    private let getUserDataUseCase: GetUserDataUseCase
    private let saveUserDataUseCase: SaveUserDataUseCase

    init(getAllProvinsiUseCase: GetAllProvinsiUseCase, getAllKotaUseCase: GetAllKotaUseCase, getUserDataUseCase: GetUserDataUseCase, saveUserDataUseCase: SaveUserDataUseCase) {
        self.getAllProvinsiUseCase = getAllProvinsiUseCase
        self.getAllKotaUseCase = getAllKotaUseCase
        self.getUserDataUseCase = getUserDataUseCase
        self.saveUserDataUseCase = saveUserDataUseCase
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

    func getUser() throws {
        let userData = try getUserDataUseCase.execute()
        print(userData?.name)
        print(userData?.kota.name)
        print(userData?.provinsi.name)
    }

    @MainActor
    func saveUser() throws {
        let user = User(
            name: name,
            provinsi: selectedProvinsi ?? Provinsi(id: "0", name: ""),
            kota: selectedKota ?? Kota(id: "0", idProvinsi: "0", name: "")
        )

        try saveUserDataUseCase.execute(user: user)
    }
}
