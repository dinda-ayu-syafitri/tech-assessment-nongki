//
//  UserRepositoryProtocol.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUserData() throws -> User?
    func saveUserData(user: User) throws
}
