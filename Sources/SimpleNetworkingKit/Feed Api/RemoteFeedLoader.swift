//
//  RemoteFeedLoader.swift
//  
//
//  Created by Guillermo Moral on 07/01/2023.
//

import Foundation

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Result : Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping(Result) -> Void = { _ in}) {
        client.get(from: url) { result in
            
            switch result {
                case let .success(data, response):
                    if let _ = try? JSONSerialization.jsonObject(with: data) {
                    completion(.success([]))
                } else {
                    completion(.failure(.invalidData))
                }
                case .failure:
                    completion(.failure(.connectivity))
            }
        }
    }
}
