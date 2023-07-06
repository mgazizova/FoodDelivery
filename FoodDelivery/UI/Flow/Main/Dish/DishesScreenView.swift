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
                        Text(tag.name)
                            .frame(width: 94, height: 35)
                            .font(.system(size: 15))
                            .background(viewModel.selectedTag == tag ? Asset.Colors.accent.color : Asset.Colors.backgroundGrey.color)
                            .foregroundColor(viewModel.selectedTag == tag ? .white : .black)
                            .cornerRadius(10)
                            .onTapGesture {
                                viewModel.selectedTag = tag
                                viewModel.filterDisplayedDishes()
                            }
                    }
                    .onAppear {
                        viewModel.selectedTag = viewModel.tags[0]
                        viewModel.filterDisplayedDishes()
                    }
                }
            }
            .padding(.top, 14)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(viewModel.displayedDishes) { dish in
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
