//
//  CoinLogoView.swift
//  CryptoApp
//
//  Created by Mohammad Shariq on 13/07/25.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
    }
}

struct CoinLogoView_Preview: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
            
    }
}

//#Preview {
//    CoinLogoView()
//}
