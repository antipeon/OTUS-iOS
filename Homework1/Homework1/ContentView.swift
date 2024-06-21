//
//  ContentView.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 12.06.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ProductViewModel
    @State var selectedTab = 1
    @State var shouldOpenSecondRow = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RoutingView {
                shouldOpenSecondRow = true
                selectedTab = 2
            }
            .tabItem {
                Label("Main", systemImage: "paperplane")
            }
            .tag(1)
            
            ProfileView(products: $model.products, shouldOpenSecondRow: $shouldOpenSecondRow)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)
            
            SettingsView(products: model.products)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(3)
        }
    }
}

#Preview {
    ContentView(model: ProductViewModel())
}
