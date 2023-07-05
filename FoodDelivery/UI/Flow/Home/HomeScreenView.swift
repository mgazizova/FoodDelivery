//
//  HomeScreenView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 29.06.2023.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        TabView {
            MainScreenView(viewModel: viewModel)
                .tabItem {
                    Asset.Images.main
                    Text(Strings.TabBar.main)
                }
            SearchView()
                .tabItem {
                    Asset.Images.search
                    Text(Strings.TabBar.search)
                }
            CartView(viewModel: viewModel)
                .tabItem {
                    Asset.Images.cart
                    Text(Strings.TabBar.cart)
                }
            AccountView()
                .tabItem {
                    Asset.Images.account
                    Text(Strings.TabBar.account)
                }
        }
        .overlay {
            if let _ = viewModel.selectedDish {
                ZStack {
                    Color(.black).opacity(0.4).ignoresSafeArea()
                    DishDetailView(viewModel: viewModel)
                        .padding([.leading, .trailing], 16)
                }
            }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UITabBar.appearance().unselectedItemTintColor = Asset.Colors.grey
        }
        .accentColor(Asset.Colors.accent.color)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeScreenViewModel(networkService: NetworkService.shared, coordinator: HomeScreenCoordinator()))
    }
}
