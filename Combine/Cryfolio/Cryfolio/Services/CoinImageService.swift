//
//  CoinImageService.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 13.02.2025.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    
    @Published var image: UIImage?
    private var subscription: AnyCancellable?
    
    init(url: String) {
        getCoinImage(url: url)
    }
    
    private func getCoinImage(url: String) {
        guard let url = URL(string: url) else { return }
        
        subscription = NetworkingManager.download(url: url)
            .tryMap { data -> UIImage? in UIImage(data: data) }
            .sink(receiveCompletion: NetworkingManager.handle, receiveValue: { [weak self] response in
                guard let _self = self else { return print(#file, #line) }
                
                _self.image = response
                _self.subscription?.cancel()
            })
    }
}
