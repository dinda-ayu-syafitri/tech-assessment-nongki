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

    init(id: UUID = UUID(), name: String, provinsi: Provinsi, kota: Kota) {
        self.id = id
        self.name = name
        self.provinsi = provinsi
        self.kota = kota
    }
}
