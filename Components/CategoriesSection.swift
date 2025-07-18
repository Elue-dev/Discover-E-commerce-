//
//  CategoriesSection.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct CategoriesSection: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingCategories {
                 ProgressView()
            } else {
                Text("Categories")
            }
            
           
        }
        .task {
            viewModel.loadProductsCategories()
        }
    }
}

struct CategoriesSection_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesSection()
    }
}
