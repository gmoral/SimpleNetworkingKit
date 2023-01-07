//
//  FeedItem.swift
//  
//
//  Created by Guillermo Moral on 06/01/2023.
//

import Foundation

public struct FeedItem : Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
