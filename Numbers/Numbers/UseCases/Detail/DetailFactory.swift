//
//  DetailFactory.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

extension UseCaseFactory {
    static func detailViewController(withParams params: DetailParams? = nil) -> DetailViewController {
        
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle.main)
        guard let view = storyboard.instantiateInitialViewController() as? DetailViewController else {
            preconditionFailure("DetailViewController cannot be instantiated")
        }
        
        let presenter = DetailPresenter(view: view, numbersProvider: ProviderFactory.numbersProvider(), params: params)
        
        view.presenter = presenter
        
        return view
    }
}
