//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Mohammad Shariq on 27/06/25.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
