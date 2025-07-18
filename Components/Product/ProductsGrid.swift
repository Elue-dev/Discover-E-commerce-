//
//  ProductsGrid.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct ProductsGrid: View {
    @ObservedObject var viewModel: ProductViewModel
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    
    var body: some View {
        ZStack {
            if viewModel.isLoadingProducts {
                 ProgressView()
            } else {
                ScrollView(showsIndicators: false) {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.products, id: \.id) { product in
                                ProductCard(product: product)
                            }
                        }
                    }
                }
                .padding(20)
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
