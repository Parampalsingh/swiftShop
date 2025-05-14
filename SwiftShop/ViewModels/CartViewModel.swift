//
//  CartViewModel.swift
//  SwiftShop
//
//  Created by param on 14/05/25.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product] = []

    func addToCart(_ product: Product) {
        cartItems.append(product)
    }

    func itemCount() -> Int {
        cartItems.count
    }
}
