//
//  SwiftShopApp.swift
//  SwiftShop
//
//  Created by param on 04/05/25.
//

import SwiftUI

@main
struct SwiftShopApp: App {
    @StateObject private var cart = CartViewModel()
    
    init() {
        
        let savedLang = LanguageManager.shared.currentLanguage
        Bundle.setLanguage(savedLang)
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView().environmentObject(cart)
        }
    }
}

