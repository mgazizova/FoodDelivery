//
//  CounterView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 05.07.2023.
//

import SwiftUI

struct CounterView: View {
    var count: Int
    
    var body: some View {
        HStack {
            Button {
                print("-")
            } label: {
                Asset.Images.minus
            }
            .padding(.leading, 6)
            .padding([.top, .bottom], 4)
            
            Text("\(count)")
                .padding([.leading, .trailing], 12)
                .font(.system(size: 14))
            
            Button {
                print("+")
            } label: {
                Asset.Images.plus
            }
            .padding(.trailing, 6)
        }
        .background(Asset.Colors.secondaryBackgroundGrey.color)
        .cornerRadius(10)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(count: 1)
    }
}
