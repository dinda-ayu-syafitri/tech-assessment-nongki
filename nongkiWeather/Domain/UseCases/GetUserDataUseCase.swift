//
//  GetUserDataUseCase.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol GetUserDataUseCase {
    func execute() throws -> User?
}

class GetUserDataUseCaseImpl: GetUserDataUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute() throws -> User? {
        let user = try userRepository.getUserData()
        return user
    }
}
