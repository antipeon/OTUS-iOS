import SwiftUI

struct ProfileView: View {
    @Binding var products: [Product]
    @Binding var shouldOpenSecondRow: Bool
    
    var body: some View {
        
        NavigationView {
            List(products, id: \.self) { product in
                if products.firstIndex(of: product) == 2 {
                    NavigationLink(
                        destination: ProductView(product: product),
                        isActive: $shouldOpenSecondRow
                    ) {
                        productPreview(product)
                    }
                } else {
                    NavigationLink {
                        ProductView(product: product)
                    } label: {
                        productPreview(product)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func productPreview(_ product: Product) -> some View {
        HStack {
            Text("\(product.name): \(product.count)")
        }
    }
}

#Preview {
    ProfileView(
        products: .constant(ProductViewModel().products),
        shouldOpenSecondRow: .constant(false)
    )
}
