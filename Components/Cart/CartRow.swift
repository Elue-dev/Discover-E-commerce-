//
//  CartItem.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct CartRow: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    var item: CartItem

    var body: some View {
        let isDarkMode = colorScheme == .dark

        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: item.product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .clipped()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isDarkMode ? Color.appBlack : Color.black.opacity(0.1), lineWidth: 1)
            )

            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Text(item.product.title)
                        .lineLimit(1)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .frame(maxWidth: 220, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: "trash")
                        .foregroundColor(Constants.UI.redColor)
                        .font(.title3)
                        .onTapGesture {
                            withAnimation {
                                cartManager.removeFromCart(product: item.product)
                            }
                        }
                }

                Text("Size L")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)

                HStack {
                    Text("$ \(item.product.price, specifier: "%.2f")")
                        .fontWeight(.semibold)
                        .font(.title3)

                    Spacer()

                    QuantitySelector(cartItem: item)
                        .environmentObject(cartManager)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        
    }
}


struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        CartRow(item: CartItem(
            product: Constants.DummyData.sampleProduct,
            quantity: 1
        ))
        .environmentObject(CartManager())
    }
}
