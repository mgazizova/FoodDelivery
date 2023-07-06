//
//  DishDetailView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import SwiftUI
import Kingfisher

struct DishDetailView: View {
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        if let dish = viewModel.selectedDish {
            VStack {
                ZStack {
                    KFImage(URL(string: dish.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                }
                .frame(width: 311, height: 232)
                .background(Asset.Colors.backgroundGrey.color)
                .cornerRadius(10)
                .padding(.bottom, 8)
                .overlay(alignment: .topTrailing) {
                    HStack (spacing: 8){
                        Button {
                            print("like")
                        } label: {
                            Asset.Images.like
                        }
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        
                        Button {
                            self.viewModel.selectedDish = nil
                        } label: {
                            Asset.Images.dismiss
                        }
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(8)
                    }
                    .padding([.top, .trailing], 8)
                }
                
                Text(dish.name)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                PriceWeightView(price: dish.price,
                                weight: dish.weight)
                .padding([.top, .bottom], 8)
                
                Text(dish.description)
                    .font(.system(size: 14))
                    .opacity(0.65)
                    .padding(.bottom, 16)
                
                Button {
                    viewModel.cartDishes[dish] = (viewModel.cartDishes[dish] ?? 0) + 1
                    self.viewModel.selectedDish = nil
                } label: {
                    Text(Strings.Action.addToCart)
                        .font(.system(size: 16))
                }
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(Asset.Colors.accent.color)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(16)
            .background(.white)
            .cornerRadius(15)
        }
    }
}
