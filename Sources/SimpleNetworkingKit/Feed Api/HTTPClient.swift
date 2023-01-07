//
//  File.swift
//  
//
//  Created by Guillermo Moral on 07/01/2023.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping(HTTPClientResult)-> Void)
}
