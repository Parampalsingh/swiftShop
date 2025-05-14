//
//  ProductListViewModel.swift
//  SwiftShop
//
//  Created by param on 11/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        // Dummy data – this could later come from an API or JSON
        products = [
            Product(name: NSLocalizedString("product_shoes", comment: ""), price: 59.99, imageName: "shoe.fill", description: NSLocalizedString("product_description_shoe", comment: "")),
            Product(name: NSLocalizedString("product_jacket", comment: ""), price: 89.99, imageName: "tshirt.fill", description: NSLocalizedString("product_description_tshirt", comment: "")),
            Product(name: NSLocalizedString("product_hat", comment: ""), price: 29.99, imageName: "hat.cap.fill", description: NSLocalizedString("product_description_cap", comment: ""))
        ]
    }
}
