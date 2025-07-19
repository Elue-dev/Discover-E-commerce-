//
//  CartView.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var cartItemsLocal = [
        CartItem(product: Constants.DummyData.sampleProduct, quantity: 1),
        CartItem(product: Constants.DummyData.sampleProduct, quantity: 1),
    ]
    
    var body: some View {
        BackgroundWrapper {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    BackButton()
                    Spacer()
                    HeaderTitle(title: "My Cart")
                    Spacer()
                    NotificationIcon()
                    
                }
                .padding()
                
                Spacer()
                Spacer()
                
                if cartItemsLocal.isEmpty {
                    ContentUnavailableView(title: "Your cart is empty!", description: "Start adding sweaters to your cart!", iconName: "cart.fill")
                } else {
                    ScrollView {
                        ForEach(Array(cartItemsLocal.enumerated()), id: \.element.id) { index, item in
                            CartRow(item: item)
                                .environmentObject(cartManager)
                                .padding(.horizontal)
                                .transition(.move(edge: .trailing).combined(with: .opacity))
    
                            if index < cartItemsLocal.count - 1 {
                                Divider()
                                Spacer()
                                Spacer()
    
                            }
                        }
                        
                        
                        Divider()
                        
                        HStack {
                            Text("Total")
                                .font(.title2)
                                .fontWeight(.light)
                                
                            
                            Spacer()
                            
                            Text("$ \(cartManager.total)")
                                .font(.title2).bold()
                                
                        }
                        .padding()
                        
                        
                        AppButton(buttonLabel: "Go To Checkout", hasIcon: true) {
                            print("Going to checkout")
                        }
                    }
                }
                
//                if cartManager.cartItems.count == 0 {
//                    ContentUnavailableView(title: "Your cart is empty!", description: "Start adding sweaters to your cart!", iconName: "cart.fill")
//                } else {
//                    ScrollView {
//                        ForEach(Array(cartManager.cartItems.enumerated()), id: \.element.id) { index, item in
//                            CartRow(item: item)
//                                .environmentObject(cartManager)
//                                .padding(.horizontal)
//                                .transition(.move(edge: .trailing).combined(with: .opacity))
//
//                            if index < cartManager.cartItems.count - 1 {
//                                Divider()
//                                Spacer()
//                                Spacer()
//
//                            }
//                        }
//                    }
//                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
