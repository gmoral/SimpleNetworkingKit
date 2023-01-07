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
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping(Error) -> Void = { _ in}) {
        client.get(from: url) { result in
            
            switch result {
                case .success:
                    completion(.invalidData)
                case .failure:
                    completion(.connectivity)
            }
        }
    }
}
