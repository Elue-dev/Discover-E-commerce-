//
//  ProductsGrid.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct ProductsGrid: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingProducts {
                 ProgressView()
            } else {
                VStack {
                    ForEach(viewModel.products, id: \.id) { product in
                        Text(product.title)
                    }
                }
            }
            
           
        }
        .task {
            viewModel.loadProducts()
        }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid(viewModel: ProductViewModel())
    }
}
