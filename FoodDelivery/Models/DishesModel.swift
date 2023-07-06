//
//  DishesModel.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import Foundation

struct DishesResponseModel: Codable {
    var dishes: [Dish]
}

struct Dish: Codable, Identifiable, Hashable, Comparable {
    static func < (lhs: Dish, rhs: Dish) -> Bool {
        lhs.name < rhs.name
    }
    
    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var imageUrl: String
    var tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case weight
        case description
        case imageUrl = "image_url"
        case tags = "tegs"
    }
}
