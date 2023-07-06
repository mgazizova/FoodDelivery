//
//  DishesAPI.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Alamofire

enum DishesAPI: RequestBuilderProtocol {
    case getDishes
}

extension DishesAPI {
    var fullURL: URL {
        switch self {
        case .getDishes:
            return URL(string: "\(baseURL)/aba7ecaa-0a70-453b-b62d-0e326c859b3b")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getDishes:
            return .get
        }
    }
}
