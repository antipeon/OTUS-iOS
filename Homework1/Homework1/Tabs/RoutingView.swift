//
//  RoutingView.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 17.06.2024.
//

import SwiftUI

struct RoutingView: View {
    private let onTap: () -> ()
    
    init(onTap: @escaping () -> ()) {
        self.onTap = onTap
    }
    
    var body: some View {
        Color.white
            .overlay {
                Button("Navigate", action: onTap)
                    .buttonStyle(.bordered)
            }
    }
}

#Preview {
    RoutingView(onTap: {})
}
