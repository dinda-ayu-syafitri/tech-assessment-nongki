//
//  UserLocalDataSourceProtocol.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

protocol UserLocalDataSourceProtocol {
    func getUserData() throws -> User?
    func saveUserData(user: User) throws
//    func updateUserData(id: UUID) throws
}
