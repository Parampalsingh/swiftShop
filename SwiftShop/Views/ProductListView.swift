//
//  ProductListView.swift
//  SwiftShop
//
//  Created by param on 11/05/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product))) {
                    HStack {
                        Image(systemName: product.imageName)
                            .resizable()
                            .scaledToFill().frame(width: 25,height: 25)
                            .foregroundColor(.blue).padding()
                        
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Text(String(format: "$%.2f", product.price))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle(NSLocalizedString("product_list_title", comment: ""))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart")
                            .font(.title2)
                        if cart.itemCount() > 0 {
                            Text("\(cart.itemCount())")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 8, y: -8) // 👈 overlaps the cart icon
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProductListView()
}
