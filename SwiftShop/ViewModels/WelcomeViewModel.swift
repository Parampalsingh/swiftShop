//
//  WelcomeViewModel.swift
//  SwiftShop
//
//  Created by param on 04/05/25.
//

import Foundation

struct LanguageOption: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let flag: String
}

class WelcomeViewModel: ObservableObject {
    @Published var selectedLanguage: String = LanguageManager.shared.currentLanguage
    
    let languages: [LanguageOption] = [
        LanguageOption(code: "en", name: "English", flag: "🇺🇸"),
        LanguageOption(code: "de", name: "Deutsch", flag: "🇩🇪")
    ]
    
    
    func startShopping() {
        print("Start Shopping tapped!")
        // Navigation logic will be added later
    }
    
    var title: String {
        NSLocalizedString("welcome_title", comment: "")
    }
    
    var subtitle: String {
        NSLocalizedString("welcome_subtitle", comment: "")
    }
    
    var startButtonTitle: String {
        NSLocalizedString("start_shopping", comment: "")
    }
    
    var availableLanguages = ["en", "de"]
    
    func changeLanguage(to lang: String) {
        LanguageManager.shared.currentLanguage = lang
        selectedLanguage = lang
        Bundle.setLanguage(lang)
        objectWillChange.send()
    }
    
    func currentLanguageFlag() -> String {
        languages.first { $0.code == selectedLanguage }?.flag ?? "🌐"
    }
    
    func currentLanguageName() -> String {
        languages.first { $0.code == selectedLanguage }?.name ?? "Language"
    }
}


