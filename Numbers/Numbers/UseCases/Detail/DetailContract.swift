//
//  DetailContract.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

struct DetailParams {
    let name: String
}

struct DetailViewContent {
    let text: String?
    let imageUrl: URL?
}

protocol DetailView: BaseViewControlling {
    func display(viewContent: DetailViewContent)
}
