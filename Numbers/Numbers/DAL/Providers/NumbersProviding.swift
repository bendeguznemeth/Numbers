//
//  NumbersProviding.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

protocol NumbersProviding {
    func fetchNumbers(completion: @escaping (Result<[NumberModel], AppError>) -> Void)
    func fetchNumberDetail(forName name: String, completion: @escaping (Result<NumberModel, AppError>) -> Void)
}
