//
//  ProductDetailView.swift
//  SwiftShop
//
//  Created by param on 13/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .resizable().scaledToFill()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text(viewModel.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(viewModel.description)
                .font(.body)
                .padding(.top, 10)
            
            Text(viewModel.priceString)
                .font(.headline)
                .foregroundColor(.green)
            
            
            Button {
                cart.addToCart(viewModel.product)
            } label: {
                Label(NSLocalizedString("add_to_cart", comment: ""), systemImage: "cart.badge.plus")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
