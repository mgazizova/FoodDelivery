//
//  Route.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 30.06.2023.
//

import Foundation

enum NavigationTransitionStyle {
    case push
}

protocol Route: Hashable {
    var transition: NavigationTransitionStyle { get }
}

enum AppRoute: Route {
    case mainScreen
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .mainScreen:
            return .push
        }
    }
}

enum HomeScreenRoute: Route {
    case goToCategory
    
    var transition: NavigationTransitionStyle {
        switch self {
        case .goToCategory:
            return .push
        }
    }
}
