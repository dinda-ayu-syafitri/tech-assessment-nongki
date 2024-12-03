//
//  DaerahRemoteDataSourceProtocol.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import Foundation

protocol DaerahRemoteDataSourceProtocol {
    func getAllProvinsi() async throws -> [Provinsi]
    func getAllKota(idProvinsi: String) async throws -> [Kota]
}
