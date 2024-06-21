//
//  ChoiceViewAdapter.swift
//  Homework1
//
//  Created by Samat Gaynutdinov on 20.06.2024.
//

import SwiftUI

struct ChoiceViewAdapter: UIViewRepresentable {
    
    let products: [String]
    @Binding var isPresented: Bool
    @Binding var selectedProduct: String?
    
    // MARK: - UIViewRepresentable
    func makeCoordinator() -> ChoiceViewCoordinator {
        ChoiceViewCoordinator(items: products) { choice in
            isPresented.toggle()
            selectedProduct = choice
        }
    }
    
    func makeUIView(context: Context) -> ChoiceViewUIKit {
        let view = ChoiceViewUIKit()
        view.delegate = context.coordinator
        view.dataSource = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: ChoiceViewUIKit, context: Context) {
        let coordinator = context.coordinator
        guard let selectedProduct, let index = coordinator.indexOf(selectedProduct) else { return }
        uiView.setSelected(index)
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: ChoiceViewUIKit, context: Context) -> CGSize? {
        uiView.sizeThatFits(proposal.cgSize)
    }
}

private extension ProposedViewSize {
    var cgSize: CGSize {
        CGSize(width: width ?? .greatestFiniteMagnitude, height: height ?? .greatestFiniteMagnitude)
    }
}

#Preview {
    ChoiceViewAdapter(products: ["SUI", "UIKit"], isPresented: .constant(true), selectedProduct: .constant(nil))
}
