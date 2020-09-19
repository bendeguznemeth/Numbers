//
//  HTTPURLResponse+Extension.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var containsServerError: Bool {
        return (200...299).contains(self.statusCode)
    }
}
