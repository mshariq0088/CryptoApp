//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Mohammad Shariq on 30/06/25.
//

import SwiftUI

struct PortfolioView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Hello")
                }
            }
            .navigationTitle("Edit Porfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        //presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            })
        }
    }
}

#Preview {
    PortfolioView()
}
