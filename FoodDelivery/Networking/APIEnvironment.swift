//
//  APIEnvironment.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Foundation

enum APIEnvironment {
    case development
    
    var baseURL: String {
        switch self {
        case .development:
            return "https://run.mocky.io/v3"
        }
    }
}
