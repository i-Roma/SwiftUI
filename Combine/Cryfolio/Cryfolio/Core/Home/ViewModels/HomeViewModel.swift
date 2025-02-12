//
//  HomeViewModel.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 10.02.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(CoinModel.dummy)
            self.portfolioCoins.append(CoinModel.dummy)
        }
    }
}


// MARK: - DummyData

extension HomeViewModel {
    
    static let dummy = HomeViewModel()
}
