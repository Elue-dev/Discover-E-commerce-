//
//  ProductCard.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct ProductCard: View {
    @Environment(\.colorScheme) var colorScheme
    var product: Product

    var body: some View {
        let isDarkMode = colorScheme == .dark

        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.images[0])) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 180, height: 180)
            .clipped()
            .cornerRadius(10)
            .overlay(
                ZStack(alignment: .topTrailing) {
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isDarkMode ? Color.appBlack : Color.black.opacity(0.1), lineWidth: 1)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .padding(10)
                            .foregroundColor(isDarkMode ?.black : .white)
                            .background(isDarkMode ? Color.appGray : .black)
                            .cornerRadius(50)
                            .padding(7)
                    }
                }
               
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.title3).bold()
                    .lineLimit(1)
                    .foregroundColor(.primary)

                Text("$\(product.price, specifier: "%.2f")")
                    .font(.system(size: 17))
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 180, alignment: .leading)
    }
}



struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        return ProductCard(product: Constants.DummyData.sampleProduct)
    }
}
