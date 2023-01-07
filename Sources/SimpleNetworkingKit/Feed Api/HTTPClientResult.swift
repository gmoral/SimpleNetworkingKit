//
//  File.swift
//  
//
//  Created by Guillermo Moral on 07/01/2023.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}
