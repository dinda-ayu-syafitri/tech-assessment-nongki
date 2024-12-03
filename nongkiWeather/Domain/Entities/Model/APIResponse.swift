//
//  APIResponse.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 04/12/24.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let code: String
    let messages: String
    let value: T
}
