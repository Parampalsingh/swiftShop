//
//  LanguageManager.swift
//  SwiftShop
//
//  Created by param on 13/05/25.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    private let selectedLanguageKey = "selectedLanguage"
    
    var currentLanguage: String {
        get {
            UserDefaults.standard.string(forKey: selectedLanguageKey) ?? Locale.preferredLanguages.first ?? "en"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: selectedLanguageKey)
            Bundle.setLanguage(newValue)
        }
    }
}
