//
//  CoinImageView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 13.02.2025.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(_ coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin))
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
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(.dummy)
        .padding()
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(.dummy)
        .padding()
        .preferredColorScheme(.dark)
}
