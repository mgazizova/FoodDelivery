//
//  CounterView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 05.07.2023.
//

import SwiftUI

struct CounterView: View {
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Button {
                count -= 1
            } label: {
                Asset.Images.minus
            }
            .padding(.leading, 6)
            .padding([.top, .bottom], 4)
            
            Text("\(count)")
                .padding([.leading, .trailing], 12)
                .font(.system(size: 14))
            
            Button {
                count += 1
            } label: {
                Asset.Images.plus
            }
            .padding(.trailing, 6)
        }
        .background(Asset.Colors.secondaryBackgroundGrey.color)
        .cornerRadius(10)
    }
}
