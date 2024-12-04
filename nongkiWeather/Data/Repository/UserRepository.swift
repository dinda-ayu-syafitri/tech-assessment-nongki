//
//  UserRepository.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

class UserRepository: UserRepositoryProtocol {
    private let userLocalDataSource: UserLocalDataSourceProtocol

    init(userLocalDataSource: UserLocalDataSourceProtocol) {
        self.userLocalDataSource = userLocalDataSource
    }

    func getUserData() throws -> User? {
        let userData = try userLocalDataSource.getUserData()
        return userData
    }

    func saveUserData(user: User) throws {
        try userLocalDataSource.saveUserData(user: user)
    }
}
