//
//  APICaller.swift
//  Stocks App
//
//  Created by Ethan Gonsalves on 2023-01-11.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private struct Constants {
        static let apiKey = "cf05go2ad3iasqg2pqp0cf05go2ad3iasqg2pqpg"
        static let sandboxApiKey = "https://finnhub.io/api/v1/"
        static let baseUrl = "https://finnhub.io/api/v1/"
    }
    private init() {
        
    }
    
    // MARK: -Public
    public func search(
        query: String,
        completion: @escaping (Result<SearchResponse, Error>) -> Void
        
    ) {
        request(
            url: url(for: .search,
                     queryParams: ["q":query]
                    ),
            expecting: SearchResponse.self, completion: completion
         
        )
    }
    
    
    
    //MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case noDataReturned
        case invalidURL
    }
    
    private func url(
        for endpoint: Endpoint,
        queryParams: [String: String] = [:]
    ) -> URL? {
        
        var urlString = Constants.baseUrl + endpoint.rawValue
        
        var queryItems = [URLQueryItem]()
        // Add any parameters
        for (name, value) in queryParams {
            queryItems.append(.init(name: name, value: value))
        }
        // add token
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        
        //convert queri items to suffix string
        
        urlString += "?" + queryItems.map { "\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        print("\n\(urlString)\n")
        return URL(string: urlString)
    }
    
    
    
    
    private func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        guard let url = url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                }else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            do{
                let result = try  JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    
}
