//
//  Homework1App.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 12.06.2024.
//

import SwiftUI

@main
struct Homework1App: App {
    private let viewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: viewModel)
        }
    }
}
