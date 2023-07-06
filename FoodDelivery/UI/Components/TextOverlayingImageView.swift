//
//  TextOverlayingImageView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 04.07.2023.
//

import SwiftUI

struct TextOverlayingImageView: View {
    var text: String
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .semibold))
                    .multilineTextAlignment(.leading)
            }
            .frame(width: geometryProxy.size.width * 2 / 3, alignment: .leading)
        }
        .padding(.leading, 16)
        .padding(.top, 12)
    }
}

struct TextOverlayingImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextOverlayingImageView(text: "HELLO")
    }
}
