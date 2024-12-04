//
//  KotaModel.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import Foundation

struct Kota: Codable, Equatable, Identifiable, Hashable {
    var id: String
    var idProvinsi: String
    var name: String
}
