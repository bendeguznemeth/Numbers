//
//  MasterFactory.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

extension UseCaseFactory {
    static func masterViewController(withParams params: MasterParams) -> MasterViewController {
        
        let storyboard = UIStoryboard(name: "Master", bundle: Bundle.main)
        guard let view = storyboard.instantiateInitialViewController() as? MasterViewController else {
            preconditionFailure("MasterViewController cannot be instantiated")
        }
        
        let numbersProvider = ProviderFactory.numbersProvider()
        
        let presenter = MasterPresenter(view: view,
                                        numbersProvider: numbersProvider,
                                        params: params)
        
        view.presenter = presenter
        
        return view
    }
}
