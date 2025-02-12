//
//  HomeViewModel.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 10.02.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let coinDataServices = CoinDataServices()
    private var subscription = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        coinDataServices.$allCoins
            .sink { [weak self] allCoins in
                guard let _self = self else { return print(#file, #line) }
                _self.allCoins = allCoins
            }
            .store(in: &subscription)
    }
}


// MARK: - DummyData

extension HomeViewModel {
    
    static let dummy = HomeViewModel()
}
