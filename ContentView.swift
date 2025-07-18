//
//  ContentView.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            Button {
                viewModel.loadProducts()
                print(viewModel.products)
            } label: {
                Text("see data")
            }

        }
        .onAppear {
            viewModel.loadProducts()
            viewModel.loadProductsCategories()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
