//
//  ProductViewModel.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 16.06.2024.
//

import Foundation

final class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        products = (0...10).map { index in
            let product1 = Product(name: "Car", count: Int.random(in: 5...9), imageName: "car")
            let product2 = Product(name: "Bicycle", count: Int.random(in: 1...4), imageName: "bicycle")
            
            return index == 2 ? product2 : product1
        }
    }
}
