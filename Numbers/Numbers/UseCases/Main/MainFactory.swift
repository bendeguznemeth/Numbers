//
//  MainFactory.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

extension UseCaseFactory {
    static func mainViewController() -> MainViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let view = storyboard.instantiateInitialViewController() as? MainViewController else {
            preconditionFailure("MainViewController cannot be instantiated")
        }
        
        return view
    }
}
