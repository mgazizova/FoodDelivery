//
//  NetworkService.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Alamofire
import Combine

protocol NetworkServiceProtocol: AnyObject {
    func execute<T: Codable>(_ urlRequest: RequestBuilderProtocol,
                             model: T.Type,
                             completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable
}

extension NetworkServiceProtocol {
    func execute<T: Codable>(_ urlRequest: RequestBuilderProtocol,
                            model: T.Type,
                            completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable {
        let cancelable = AF.request(urlRequest)
            .validate()
            .publishDecodable(type: T.self)
            .sink { result in
                if let value = result.value {
                    completion(Result.success(value))
                } else if let error = result.error {
                    completion(Result.failure(error))
                }
            }
        return cancelable
    }
}

class NetworkService: NetworkServiceProtocol {
    static let shared: NetworkServiceProtocol = NetworkService()
}
