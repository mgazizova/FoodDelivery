//
//  HomeScreenCoordinator.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import SwiftUI

class HomeScreenCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func route(to route: HomeScreenRoute) -> some View {
        return AccountView()
    }
}
