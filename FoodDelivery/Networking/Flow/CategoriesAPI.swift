//
//  CategoriesAPI.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Alamofire

enum CategoriesAPI: RequestBuilderProtocol {    
    case getCategories
}

extension CategoriesAPI {
    var fullURL: URL {
        switch self {
        case .getCategories:
            return URL(string: "\(baseURL)/058729bd-1402-4578-88de-265481fd7d54")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCategories:
            return .get
        }
    }
}
