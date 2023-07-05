//
//  CartView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            ZStack {
                if viewModel.cartDishes.isEmpty {
                    Text(Strings.Warnings.cartIsEmpty)
                        .font(.system(size: 18))
                        .opacity(0.4)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.cartDishes.keys.sorted(), id: \.self) { dish in
                                DishCartView(dish: dish,
                                             count: viewModel.cartDishes[dish] ?? 0)
                            }
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 14)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LocationView()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    AccountImageView()
                }
            }
        }
    }
}
