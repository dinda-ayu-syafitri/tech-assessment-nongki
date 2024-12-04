//
//  DaerahRepositoryProtocol.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol DaerahRepositoryProtocol {
    func getAllProvinsi() async throws -> [Provinsi]
    func getAllKota(idProvinsi: String) async throws -> [Kota]
}
