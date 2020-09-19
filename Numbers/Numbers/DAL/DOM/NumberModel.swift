//
//  NumberModel.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

struct NumberModel: Codable {
    
    let name: String
    let text: String?
    
    private let image: String
    
    var imageUrl: URL? {
        URL(string: image)
    }
}
