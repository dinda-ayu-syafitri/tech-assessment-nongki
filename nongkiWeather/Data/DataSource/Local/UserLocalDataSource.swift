//
//  UserLocalDataSource.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation
import SwiftData

class UserLocalDataSource: UserLocalDataSourceProtocol {
    private var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func getUserData() throws -> User? {
        let fetchDescriptor = FetchDescriptor<User>()
        let localData = try modelContext.fetch(fetchDescriptor)
        print(localData.count)
        let user = localData.first
        return user
    }

    func saveUserData(user: User) throws {
        let userData = try getUserData()

        if let existingUser = userData {
            existingUser.name = user.name
            existingUser.provinsi = user.provinsi
            existingUser.kota = user.kota
            existingUser.lat = user.lat
            existingUser.lon = user.lon
        } else {
            modelContext.insert(user)
        }

        try modelContext.save()
    }

//    func updateUserData(id: UUID) throws {
//        <#code#>
//    }
}
