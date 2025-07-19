//
//  CartManager.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

class CartManager : ObservableObject {
    @Published private(set) var cartItems: [CartItem] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: {$0.product.id == product.id}) {
            cartItems[index].quantity += 1
        } else {
            let newCartItem = CartItem(product: product, quantity: 1)
            cartItems.append(newCartItem)
        }
    
        total += Int(product.price)
    }
    
    func removeFromCart(product: Product) {
           if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
               let item = cartItems[index]
               total -= Int(item.product.price) * item.quantity
               cartItems.remove(at: index)
           }
       }
    
    
    func increaseQuantity(for product: Product) {
           if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
               cartItems[index].quantity += 1
               total += Int(product.price)
           }
       }

    
    
    func decreaseQuantity(for product: Product) {
           if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
               cartItems[index].quantity -= 1
               total -= Int(product.price)

               if cartItems[index].quantity <= 0 {
                   cartItems.remove(at: index)
               }
           }
       }
}

