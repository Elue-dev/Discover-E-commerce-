//
//  ProductViewModel.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var categories: [String] = []
    @Published var isLoadingProducts = false
    @Published var isLoadingCategories = false
    @Published var productsErrorMessage: String?
    @Published var categoriesErrorMessage: String?
    
    
    func loadProducts(completion: (() -> Void)? = nil) {
        isLoadingProducts = true
        productsErrorMessage = nil

        ProductService.shared.getProducts { result in
            DispatchQueue.main.async {
                self.isLoadingProducts = false
                switch result {
                case .success(let response):
                    self.products = response.products
                case .failure(let error):
                    self.productsErrorMessage = error.localizedDescription
                }
                completion?() 
            }
        }
    }

    
    func loadProductsCategories(completion: (() -> Void)? = nil) {
        isLoadingCategories = true
        categoriesErrorMessage = nil

        ProductService.shared.getProductCategories { result in
            DispatchQueue.main.async {
                self.isLoadingCategories = false
                switch result {
                case .success(let response):
                    self.categories = response
                case .failure(let error):
                    self.categoriesErrorMessage = error.localizedDescription
                }
                completion?()
            }
        }
    }

}

