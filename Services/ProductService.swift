//
//  ProductService.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import Foundation

class ProductService {
    static let shared = ProductService()
    
    private init() {}

    func getProducts(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.API.baseURL)/products") else {
                 completion(.failure(URLError(.badURL)))
                 return
            }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
                completion(.success(productsResponse))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getProductCategories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.API.baseURL)/products/category-list") else {
                 completion(.failure(URLError(.badURL)))
                 return
            }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode([String].self, from: data)
                completion(.success(productsResponse))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    func getProductsByCategory(_ category: String, completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        let formattedCategory = category.lowercased().replacingOccurrences(of: " ", with: "-")
        
        guard let url = URL(string: "\(Constants.API.baseURL)/products/category/\(formattedCategory)") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
                completion(.success(productsResponse))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }

}
