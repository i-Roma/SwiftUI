//
//  CoinImageViewModel.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 13.02.2025.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private let coin: CoinModel
    private let dataServices: CoinImageService
    private var subscription = Set<AnyCancellable>()
    
    init(_ coin: CoinModel) {
        self.coin = coin
        self.dataServices = CoinImageService(url: coin.image)
        
        addSubscriber()
    }
    
    private func addSubscriber() {
        dataServices.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &subscription)
    }
}
