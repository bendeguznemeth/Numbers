//
//  NumbersProvider.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class NumbersProvider: BaseProvider, NumbersProviding {
    
    let urlString = "http://dev.tapptic.com/test/json.php"
    
    func fetchNumbers(completion: @escaping (Result<[NumberModel], AppError>) -> Void) {
        sendRequest(urlString, completion: completion)
    }
    
    func fetchNumberDetail(forName name: String, completion: @escaping (Result<NumberModel, AppError>) -> Void) {
        sendRequest(urlString, parameters: ["name": name], completion: completion)
    }
}
