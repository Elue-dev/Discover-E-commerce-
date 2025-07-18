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
    @Published var selectedCategory: String? = "All"
    
    
    func loadProducts(completion: (() -> Void)? = nil) {
        isLoadingProducts = true
        productsErrorMessage = nil

        ProductService.shared.getProducts { result in
            DispatchQueue.main.async {
                self.isLoadingProducts = false
                switch result {
                case .success(let response):
                    self.products = response.products
                    print("fetched \(response.products.count) products")
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
                    self.categories = response.map { category in
                        category
                            .replacingOccurrences(of: "-", with: " ")
                            .capitalized
                    }
                    self.categories.insert("All", at: 0)
                case .failure(let error):
                    self.categoriesErrorMessage = error.localizedDescription
                }
                completion?()
            }
        }
    }

    
    func loadProductsForCategory(category: String, completion: (() -> Void)? = nil) {
        selectedCategory = category

        if category == "All" {
            loadProducts()
            return
        }

        isLoadingProducts = true
        productsErrorMessage = nil
        ProductService.shared.getProductsByCategory(category) { result in
            DispatchQueue.main.async {
                self.isLoadingProducts = false
                switch result {
                case .success(let response):
                    self.products = response.products
                    print("fetched \(response.products.count) products by category \(category)")
                case .failure(let error):
                    self.productsErrorMessage = error.localizedDescription
                }
                completion?()
            }
        }
    }
}

