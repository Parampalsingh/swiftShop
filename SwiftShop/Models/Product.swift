//
//  Product.swift
//  SwiftShop
//
//  Created by param on 11/05/25.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let description: String
}
