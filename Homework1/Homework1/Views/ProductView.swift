//
//  ProductView.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 16.06.2024.
//

import SwiftUI

struct ProductView: View {
    @State var product: Product
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
            Spacer()
            Image(systemName: product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Spacer()
            Text("In stock: \(product.count)")
        }
        .navigationTitle("Карточка продукта")
        .navigationBarTitleDisplayMode(.inline)
    }
}

fileprivate let testProduct = Product(name: "Car", count: 3, imageName: "car")

#Preview {
    NavigationView {
        ProductView(product: testProduct)
    }
}
