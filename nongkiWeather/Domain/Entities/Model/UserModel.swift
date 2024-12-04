//
//  UserModel.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation
import SwiftData

@Model
class User: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var provinsi: Provinsi
    var kota: Kota
    var lat: Double
    var lon: Double

    init(id: UUID = UUID(), name: String, provinsi: Provinsi, kota: Kota, lat: Double, lon: Double) {
        self.id = id
        self.name = name
        self.provinsi = provinsi
        self.kota = kota
        self.lat = lat
        self.lon = lon
    }
}
