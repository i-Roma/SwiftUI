//
//  CoinRowView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColoum: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftPart
            if showHoldingsColoum { middelPart }
            rightPart
        }
        .font(.subheadline)
    }
}

// MARK: - Extensions

extension CoinRowView {
    
    private var leftPart: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .frame(minWidth: 28)
                .foregroundColor(Color.theme.secondaryText)
            
            CoinImageView(coin)
                .frame(width: 28, height: 28)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 8)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
        }
    }
    
    private var middelPart: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Digits)
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString)
            
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightPart: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith2Digits)")
                .font(.callout)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(coin._priceChangePercentage24H.asPercentString)
                .foregroundColor(
                    coin._priceChangePercentage24H >= 0 ?
                    Color.theme.green : Color.theme.red
                )
            
        }
        .frame(width: UIScreen.main.bounds.width / 3.4, alignment: .trailing)
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: .dummy, showHoldingsColoum: true)
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: .dummy, showHoldingsColoum: true).preferredColorScheme(.dark)
}
