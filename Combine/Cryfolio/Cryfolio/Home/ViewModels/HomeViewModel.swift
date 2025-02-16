//
//  HomeViewModel.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 10.02.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistis: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -1)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText = ""
    
    private let coinDataServices = CoinDataServices()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // Not needed anymore, because subscription below
        // is updates coinDataServices.$allCoins too
        
        /*coinDataServices.$allCoins
            .sink { [weak self] allCoins in
                guard let _self = self else { return print(#file, #function, #line) }
                _self.allCoins = allCoins
            }
            .store(in: &subscriptions)*/
        
        $searchText
            .combineLatest(coinDataServices.$allCoins)
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &subscriptions)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin in
            coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}


// MARK: - DummyData

extension HomeViewModel {
    
    static let dummy = HomeViewModel()
}
