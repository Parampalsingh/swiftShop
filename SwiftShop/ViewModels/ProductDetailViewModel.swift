//
//  ProductDetailViewModel.swift
//  SwiftShop
//
//  Created by param on 13/05/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var name: String {
        product.name
    }
    
    var priceString: String {
        String(format: NSLocalizedString("price_format", comment: ""), product.price)
    }
    
    var imageName: String {
        product.imageName
    }
    
    var description: String {
        product.description
    }
}
