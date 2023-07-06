//
//  PriceWeightView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 05.07.2023.
//

import SwiftUI

struct PriceWeightView: View {
    var price: Int
    var weight: Int
    
    var body: some View {
        HStack {
            Text("\(price)₽")
            Text("·")
                .opacity(0.4)
            Text("\(weight)г")
                .opacity(0.4)
            Spacer()
        }
        .font(.system(size: 14, weight: .regular))
    }
}

struct PriceWeightView_Previews: PreviewProvider {
    static var previews: some View {
        PriceWeightView(price: 100, weight: 200)
    }
}
