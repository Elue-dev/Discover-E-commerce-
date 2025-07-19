//
//  Home.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var cartManager: CartManager
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        
        NavigationView {
            BackgroundWrapper {
                VStack {
                        HStack {
                            Text("Discover")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                            
                            HStack {
                                NavigationLink {
                                    CartView()
                                        .environmentObject(cartManager)
                                } label: {
                                    ZStack (alignment: .topTrailing) {
                                        Image(systemName: "cart")
                                            .fontWeight(.semibold)
                                        .font(.title)
                                        
                                        if cartManager.cartItems.count > 0 {
                                            Text("\(cartManager.cartItems.count)")
                                                .font(.caption).bold()
                                                .foregroundColor(.white)
                                                .frame(width: 17, height: 17)
                                                .background(Constants.UI.redColor)
                                                .cornerRadius(50)
                                        }
                                    }
                                }
                                .accentColor(isDarkMode ? Color.white : Color.black)
                                
                                NotificationIcon()
                            }
                        }
                        
                        VStack {
                            CategoriesSection(viewModel: viewModel)
                            ProductsGrid(viewModel: viewModel)
                        }
                        .padding(.top, 20)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
    }
}
