//
//  SearchResponse.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-12.
//

import Foundation


struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResult]
    
}
struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}

