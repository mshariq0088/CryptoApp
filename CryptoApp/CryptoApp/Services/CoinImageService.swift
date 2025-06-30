//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Mohammad Shariq on 27/06/25.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        self.getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = saveImage
            print("Retrieved image from file manager")
        } else {
            downloadCoinImage()
            print("Download image now")
        }
    }
    
    private func downloadCoinImage() {
        
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImages(image: downloadedImage, imageName: imageName, folderName: folderName)
            })
    }
}
