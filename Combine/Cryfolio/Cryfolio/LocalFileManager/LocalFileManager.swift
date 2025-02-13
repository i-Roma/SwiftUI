//
//  LocalFileManager.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 13.02.2025.
//

// video: https://www.youtube.com/watch?v=Z9yWdChUDlo&list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu&index=10

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func save(_ image: UIImage?, _ imageName: String, _ folderName: String) {
        
        // Create folder
        createFolderIfNeeded(folderName)
        
        // Get path for image
        guard
            let image = image,
            let data = image.pngData(),
            let url =  getURLForImage(imageName, folderName)
        else { return }
        
        // Save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print(#file, #function, #line, error)
        }
    }
    
    func get(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName, folderName),
              FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
}

// MARK: - Private

extension LocalFileManager {
    
    private func createFolderIfNeeded(_ name: String) {
        guard let url = getURLForFolder(name) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print(#file, #function, #line, error)
            }
        }
    }
    
    private func getURLForFolder(_ name: String) -> URL? {
        if let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            return url.appendingPathComponent(name)
        } else {
            return nil
        }
    }
    
    private func getURLForImage(_ imageName: String, _ folderName: String) -> URL? {
        if let url = getURLForFolder(folderName) {
            return url.appendingPathComponent(imageName + ".png")
        } else {
            return nil
        }
    }
}
