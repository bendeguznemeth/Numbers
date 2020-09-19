//
//  MasterContract.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

struct MasterParams {
    let detailNavigationCallBack: (_ name: String, _ shouldNavigate: Bool) -> Void
}

struct MasterViewContent {
    
    let cellContents: [CellContent]
    
    struct CellContent {
        let name: String
        let imageUrl: URL?
    }
}

protocol MasterView: BaseViewControlling {
    func display(viewContent: MasterViewContent)
}
