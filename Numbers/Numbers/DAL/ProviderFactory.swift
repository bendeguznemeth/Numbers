//
//  ProviderFactory.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class ProviderFactory {
    static func numbersProvider() -> NumbersProviding {
        NumbersProvider()
    }
}
