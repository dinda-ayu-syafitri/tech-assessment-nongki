//
//  SaveUserDataUseCase.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol SaveUserDataUseCase {
    func execute(user: User) throws
}

class SaveUserDataUseCaseImpl: SaveUserDataUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(user: User) throws {
        if let existingUser = try userRepository.getUserData() {
            let updatedUser = User(
                id: user.id,
                name: user.name,
                provinsi: user.provinsi,
                kota: user.kota
            )

            try userRepository.saveUserData(user: updatedUser)
        } else {
            try userRepository.saveUserData(user: user)
        }
    }
}
