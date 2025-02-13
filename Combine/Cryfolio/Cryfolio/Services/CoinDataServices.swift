//
//  CoinDataServices.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 12.02.2025.
//

import Foundation
import Combine

class CoinDataServices {
    
    @Published var allCoins: [CoinModel] = []
    private var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: coingeckoDataURL) else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handle, receiveValue: { [weak self] response in
                guard let _self = self else { return print(#file, #line) }
                
                _self.allCoins = response
                _self.coinSubscription?.cancel()
            })
    }
}
