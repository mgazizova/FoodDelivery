//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import SwiftUI

protocol AppCoordinating: Coordinator {}

extension AppCoordinating {
    func route(to route: AppRoute) -> some View {
        switch route {
        case .mainScreen:
            let networkService = NetworkService.shared
            let coordinator = HomeScreenCoordinator()
            let viewModel = HomeScreenViewModel(networkService: networkService,
                                                coordinator: coordinator)
            return HomeScreenView(viewModel: viewModel)
        }
    }
}

class AppCoordinator: AppCoordinating, ObservableObject {
    @Published var path = NavigationPath()
}
