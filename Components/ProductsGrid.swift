//
//  ProductsGrid.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct ProductsGrid: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingProducts {
                 ProgressView()
            } else {
                Text("Products Grid")
            }
            
           
        }
        .task {
            viewModel.loadProducts()
        }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid()
    }
}
