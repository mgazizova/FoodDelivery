//
//  DishCompactView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import SwiftUI
import Kingfisher

struct DishCompactView: View {
    var dish: Dish
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    KFImage(URL(string: dish.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                }
                .frame(width: 80, height: 80)
            }
            // TODO: how to not harcode this values?
            .frame(width: 109, height: 109)
            .background(Asset.Colors.backgroundGrey.color)
            .cornerRadius(10)
            
            Text(dish.name)
                .font(.system(size: 14))
                .frame(width: 109, alignment: .topLeading)
        }
    }
}
