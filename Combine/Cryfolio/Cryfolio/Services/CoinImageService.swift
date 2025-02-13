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
    
    private let coin: CoinModel
    private let imageName: String
    private let folderName = "coin_images"
    private var subscription: AnyCancellable?
    
    init(_ coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = LocalFileManager.instance.get(imageName: coin.id, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage(url: coin.image)
        }
    }
    
    private func downloadCoinImage(url: String) {
        guard let url = URL(string: url) else { return }
        
        subscription = NetworkingManager.download(url: url)
            .tryMap { data -> UIImage? in UIImage(data: data) }
            .sink(receiveCompletion: NetworkingManager.handle, receiveValue: { [weak self] returnedImage in
                guard let _self = self else { return print(#file, #function, #line) }
                
                _self.image = returnedImage
                _self.subscription?.cancel()
                
                LocalFileManager.instance.save(_self.image, _self.imageName, _self.folderName)
            })
    }
}
