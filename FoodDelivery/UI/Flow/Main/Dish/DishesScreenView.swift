//
//  DishesScreenView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import SwiftUI

struct DishesScreenView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel: HomeScreenViewModel
    
    private let columns: [GridItem] = Array(repeating: GridItem(spacing: 8, alignment: .top), count: 3)
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(viewModel.tags) { tag in
                        Button(tag.name) {
                            print("Tag tapped")
                        }
                        .frame(width: 94, height: 35)
                        .background(Asset.Colors.backgroundGrey.color)
                        .cornerRadius(10)
                        .font(.system(size: 15))
                    }
                }
            }
            .padding(.top, 14)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(viewModel.dishes) { dish in
                        DishCompactView(dish: dish)
                            .onTapGesture {
                                viewModel.selectedDish = dish
                            }
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Asset.Images.arrowBack
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                AccountImageView()
            }
        }
        .padding([.leading, .trailing], 16)
    }
}
