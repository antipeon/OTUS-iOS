//
//  SettingsViw.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 16.06.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var products: [String]
    @State var product: String?
    
    @State private var showChoice = false
    @State private var renderOption = RenderEngine.sui
    
    init(products: [Product]) {
        let names = Set(products.map(\.name)).map { $0 }
        self.products = names
        self.product = names.first
    }
    
    var body: some View {
        VStack {
            Picker("Движок", selection: $renderOption) {
                ForEach(RenderEngine.allCases, id: \.self) { engine in
                    Text("\(engine.rawValue)")
                        .font(.headline)
                }
            }
            .pickerStyle(.menu)
            
            FavoriteProductLabel
            
            Button("К выбору с помощью \(renderOption.rawValue)", action: {
                showChoice.toggle()
            })
            .sheet(isPresented: $showChoice) {
                switch renderOption {
                case .sui:
                    SuiChoiceView
                case .uikit:
                    ChoiceViewAdapter(products: products, isPresented: $showChoice, selectedProduct: $product)
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    @ViewBuilder
    private var FavoriteProductLabel: some View {
        Group {
            if let product {
                Text("Ваш любимый продукт: \(product)")
            } else {
                Text("У вас нет любимого продукта")
            }
        }
        .padding(.vertical, 8)
        .font(.headline)
    }
    
    @ViewBuilder
    private var SuiChoiceView: some View {
        VStack {
            List {
                Picker("Любимый продукт", selection: $product) {
                    ForEach(products, id: \.self) { product in
                        Text("\(product)")
                            .font(.headline)
                            .tag(product as Optional<String>)
                    }
                }
                .onChange(of: product) { _, _ in
                    showChoice.toggle()
                }
                .pickerStyle(.menu)
            }
            
            Spacer()
        }
    }
}

enum RenderEngine: String, CaseIterable, Identifiable {
    case sui = "SUI"
    case uikit = "UIKit"
    
    var id: Self { self }
}

#Preview {
    SettingsView(products: ProductViewModel().products)
}
