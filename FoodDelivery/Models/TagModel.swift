//
//  TagModel.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import Foundation

struct Tag: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var count: Int
}
