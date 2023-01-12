//
//  PersistenceManager.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-11.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    private let userDefualts: UserDefaults = .standard
    
    private struct Constants {
        
    }
    
    private init() {
        
    }
    
    //MARK: Public
    
    public var watchList: [String] {
        return []
    }
    public func addTowWatchlist() {
        
    }
    public func removeFromWatchlist() {
        
    }
    
    
    
    
    //MARK: Private
    private var hasOnboarded: Bool {
        return false
    }
}
