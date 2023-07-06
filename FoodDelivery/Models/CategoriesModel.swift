//
//  CategoriesModel.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import Foundation

struct CategoriesResponseModel: Codable {
    var сategories: [Category]
}

struct Category: Codable, Identifiable {
    var id: Int
    var name: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
    }
}
