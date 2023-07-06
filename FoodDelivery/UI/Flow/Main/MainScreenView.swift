//
//  MainPageView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            ScrollView {
                LazyVStack() {
                    ForEach(viewModel.categories) { category in
                        NavigationLink {
                            DishesScreenView(viewModel: viewModel)
                                .navigationBarBackButtonHidden(true)
                                .navigationTitle(category.name)
                        } label: {
                            CategoryView(category: category)
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
        .tint(.black)
    }
}
