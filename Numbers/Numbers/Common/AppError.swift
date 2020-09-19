//
//  AppError.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class AppError: Error {
    
    enum Code {
        case connectionError
        case parsingError
        case dataTaskError
        case serverError
        
        var message: String {
            switch self {
            case .connectionError: return "connectionError"
            case .parsingError: return "parsingError"
            case .dataTaskError: return "dataTaskError"
            case .serverError: return "serverError"
            }
        }
    }
    
    var message: String {
        return code.message
    }
    
    private let code: Code
    
    init(withCode code: Code) {
        self.code = code
    }
}
