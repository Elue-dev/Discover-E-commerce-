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
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProducts() {
          isLoading = true
          errorMessage = nil
          
          ProductService.shared.getProducts { result in
              DispatchQueue.main.async {
                  self.isLoading = false
                  switch result {
                  case .success(let response):
                      self.products = response.products
                      print("Fetched \(response.products.count) products")
                  case .failure(let error):
                      self.errorMessage = error.localizedDescription
                      print("Error getting products: \(error.localizedDescription)")
                  }
              }
          }
      }
    
    func loadProductsCategories() {
          isLoading = true
          errorMessage = nil
          
          ProductService.shared.getProductCategories { result in
              DispatchQueue.main.async {
                  self.isLoading = false
                  switch result {
                  case .success(let response):
                      self.categories = response
                      print("Fetched \(response.count) categories")
                  case .failure(let error):
                      self.errorMessage = error.localizedDescription
                      print("Error getting products: \(error.localizedDescription)")
                  }
              }
          }
      }
}

