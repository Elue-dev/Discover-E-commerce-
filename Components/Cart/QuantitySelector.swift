//
//  QuantitySelector.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct QuantitySelector: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    var cartItem: CartItem
    
    var body: some View {
        let isDarkMode = colorScheme == .dark

        HStack(spacing: 12) {
            Button {
                withAnimation {
                    cartManager.decreaseQuantity(for: cartItem.product)
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(Color.text)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isDarkMode ? Color.appBlack : Color.black.opacity(0.1), lineWidth: 1) 
                        }
                    }
            }
            
            Text("\(cartItem.quantity)")
                .fontWeight(.bold)
                .font(.title2)
            
            Button {
                withAnimation {
                    cartManager.increaseQuantity(for: cartItem.product)
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.text)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .overlay {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isDarkMode ? Color.appBlack : Color.black.opacity(0.1), lineWidth: 1)
                                
                        }
                      
                    }
            }
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelector(cartItem: CartItem(product: Constants.DummyData.sampleProduct, quantity: 1))
            .environmentObject(CartManager())
    }
}
