//
//  Global.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

public func executeOnMainThread(_ block: @escaping (() -> Void)) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async(execute: block)
    }
}
