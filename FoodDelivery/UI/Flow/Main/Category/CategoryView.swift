//
//  CategoryView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import SwiftUI
import Kingfisher

struct CategoryView: View {
    var category: Category
    
    var body: some View {
        VStack {
            KFImage(URL(string: category.imageUrl))
                .resizable()
                .scaledToFit()
                .overlay(TextOverlayingImageView(text: category.name), alignment: .topLeading)
        }
        .cornerRadius(10)
    }
}


