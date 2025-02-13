//
//  NetworkingManager.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 13.02.2025.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var localizedDescription: String {
            // error description doesn't work
            // video: https://www.youtube.com/watch?v=pp5-ASYnY0o&list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu&index=8&pp=iAQB
            switch self {
            case .badURLResponse(let url): return "⛔️ Bad response from URL: \(url)"
            case .unknown: return "🛟 Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try handleURLResponse(output: $0, url) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, _ url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode <= 300
        else {
            print(#file, #line)
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return output.data
    }
    
    static func handle(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: break
        case .failure(let error):
            print(#file, #line, error.localizedDescription)
        }
    }
}
