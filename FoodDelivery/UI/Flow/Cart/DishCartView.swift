//
//  DishCartView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 05.07.2023.
//

import SwiftUI
import Kingfisher

struct DishCartView: View {
    var dish: Dish
    @Binding var count: Int
    
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 8) {
                ZStack {
                    KFImage(URL(string: dish.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                }
                .frame(width: 62, height: 62)
                .background(Asset.Colors.backgroundGrey.color)
                .cornerRadius(6)
                
                VStack(alignment: .leading) {
                    Text(dish.name)
                        .font(.system(size: 14))
                    PriceWeightView(price: dish.price, weight: dish.weight)
                }
            }
            
            Spacer()
            
            CounterView(count: $count)
        }
    }
}
