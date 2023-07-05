//
//  Assets.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 29.06.2023.
//

import SwiftUI

enum Asset {
    enum Colors {
        static let accent = UIColor(named: "accent")!
        static let backgroundGrey = UIColor(named: "backgroundGrey")!
        static let grey = UIColor(named: "grey")!
        static let secondaryBackgroundGrey = UIColor(named: "secondaryBackgroundGrey")!
    }
    
    enum Images {
        // MARK: Navigation bar
        static let arrowBack = Image("arrowBack").renderingMode(.template)
        static let location = Image("location").renderingMode(.template)
        
        // MARK: Tab bar
        static let account = Image("account").renderingMode(.template)
        static let cart = Image("cart").renderingMode(.template)
        static let main = Image("main").renderingMode(.template)
        static let search = Image("search").renderingMode(.template)
        
        // MARK: Profile
        static let profile = Image("profile").renderingMode(.original)
        
        // MARK: Actions
        static let dismiss = Image("dismiss").renderingMode(.original)
        static let like = Image("like").renderingMode(.original)
        static let minus = Image("minus").renderingMode(.original)
        static let plus = Image("plus").renderingMode(.original)
    }
}

extension UIColor {
    var color: Color {
        return Color(self)
    }
}
