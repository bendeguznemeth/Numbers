//
//  BaseProvider.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class BaseProvider {
    
    let jsonDecoder = JSONDecoder()
    
    func sendRequest<T: Codable>(_ url: String,
                                 parameters: [String: String]? = nil,
                                 completion: @escaping (Result<T, AppError>) -> Void) {
        
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(.init(withCode: .connectionError)))
            return
        }
        
        let components = URLComponents(string: url)
        
        if var components = components {
            
            if let parameters = parameters {
                components.queryItems = parameters.map { (key, value) in
                    URLQueryItem(name: key, value: value)
                }
            }
            
            if let url = components.url {
                
                let request = URLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    guard let data = data, error == nil else {
                        completion(.failure(.init(withCode: .dataTaskError)))
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, response.containsServerError else {
                        completion(.failure(.init(withCode: .serverError)))
                        return
                    }
                    
                    completion(self.resolveResponse(data: data))
                }
                
                task.resume()
            }
        }
    }
    
    private func resolveResponse<T: Codable>(data: Data) -> Result<T, AppError> {
        do {
            let resolved = try jsonDecoder.decode(T.self, from: data)
            return Result.success(resolved)
        } catch {
            return Result.failure(.init(withCode: .parsingError))
        }
    }
}
