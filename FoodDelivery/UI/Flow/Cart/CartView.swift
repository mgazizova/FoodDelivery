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
                    VStack {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.cartDishes.keys.sorted(), id: \.self) { dish in
                                    DishCartView(dish: dish,
                                                 count: binding(for: dish))
                                }
                            }
                            .onAppear {
                                viewModel.calculateTotal()
                            }
                            .onChange(of: viewModel.cartDishes) { newValue in
                                viewModel.filterCartDishes()
                                viewModel.calculateTotal()
                            }
                        }
                        Button {
                            print("Pay")
                        } label: {
                            Text("\(Strings.Action.pay) \(viewModel.total)₽")
                                .font(.system(size: 16))
                        }
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(Asset.Colors.accent.color)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 16)
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

private extension CartView {
    func binding(for dish: Dish) -> Binding<Int> {
        return Binding(get: {
            self.viewModel.cartDishes[dish] ?? 0
        }, set: {
            self.viewModel.cartDishes[dish] = $0
        })
    }
}
