//
//  CategoriesSection.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct CategoriesSection: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingCategories {
                 ProgressView()
            } else {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(viewModel.categories, id: \.self) { category in
                                Chip(
                                    title: category,
                                    isSelected: viewModel.selectedCategory == category,
                                    onTap: {
                                        viewModel.selectedCategory = category
                                        viewModel.loadProductsForCategory(category: category)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .task {
            viewModel.loadProductsCategories()
        }
    }
}

struct CategoriesSection_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesSection(viewModel: ProductViewModel())    }
}
