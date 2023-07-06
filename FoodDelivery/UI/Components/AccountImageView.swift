//
//  AccountImageView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import SwiftUI

struct AccountImageView: View {
    var body: some View {
        Asset.Images.profile
            .resizable()
            .frame(width: 44, height: 44)
            .cornerRadius(100)
            .scaledToFit()
    }
}

struct AccountImageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountImageView()
    }
}
