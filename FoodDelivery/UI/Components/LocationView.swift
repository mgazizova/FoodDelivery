//
//  LocationView.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import SwiftUI

struct LocationView: View {
    private var dateFormatter: DateFormatter  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.init(identifier: "ru")
        return dateFormatter
    }
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .top) {
                Asset.Images.location
                
                VStack(alignment: .leading) {
                    Text("Санкт-Петербург")
                        .font(.system(size: 18))
                    Text(dateFormatter.string(from: Date()))
                        .font(.system(size: 14))
                        .opacity(0.5)
                }
                .padding(.bottom, 7)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
