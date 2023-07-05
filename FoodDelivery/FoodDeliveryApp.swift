//
//  FoodDeliveryApp.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 29.06.2023.
//

import SwiftUI

@main
struct FoodDeliveryApp: App {
    var body: some Scene {
        WindowGroup {
            let coordinator = AppCoordinator()
            coordinator.route(to: .mainScreen)
        }
    }
}
