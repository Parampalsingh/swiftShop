//
//  WelcomeView.swift
//  SwiftShop
//
//  Created by param on 04/05/25.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject private var viewModel = WelcomeViewModel()
    @State private var showProductList = false
    
    
    
    var body: some View {
        
        ZStack {
            Image(systemName: "shippingbox.fill")
                .resizable()
                .scaledToFit()
                .opacity(0.03) //
                .ignoresSafeArea().padding()
            
            NavigationStack {
                VStack(spacing: 20) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text(viewModel.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(viewModel.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Menu {
                        ForEach(viewModel.languages) { language in
                            Button(action: {
                                viewModel.changeLanguage(to: language.code)
                            }) {
                                Label("\(language.flag) \(language.name)", systemImage: "")
                            }
                        }
                    } label: {
                        Label(
                            "\(viewModel.currentLanguageFlag()) \(viewModel.currentLanguageName())",
                            systemImage: "chevron.down"
                        )
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .clipShape(Capsule())
                    }
                    
                    Button(viewModel.startButtonTitle) {
                        showProductList = true
                    }
                    .buttonStyle(.borderedProminent)
                    .navigationDestination(isPresented: $showProductList) {
                        ProductListView()
                    }
                }.onAppear {
                    Bundle.setLanguage(viewModel.selectedLanguage)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
