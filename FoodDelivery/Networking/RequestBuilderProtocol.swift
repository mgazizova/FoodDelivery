//
//  RequestBuilderProtocol.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Alamofire

protocol RequestBuilderProtocol: URLRequestConvertible {
    var baseURL: String { get }
    var fullURL: URL { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension RequestBuilderProtocol {
    var baseURL: String {
        return APIEnvironment.development.baseURL
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = try URLRequest(url: fullURL, method: method)
        headers?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return try encoding.encode(request, with: parameters)
    }
}
