//
//  MasterPresenter.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class MasterPresenter: BasePresenter {
    
    private weak var view: MasterView?
    private let numbersProvider: NumbersProviding
    private let params: MasterParams
    
    init(view: MasterView, numbersProvider: NumbersProviding, params: MasterParams) {
        self.view = view
        self.numbersProvider = numbersProvider
        self.params = params
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNumbersData()
    }
    
    private func fetchNumbersData() {
        
        view?.showLoading()
        
        numbersProvider.fetchNumbers { [weak self] result in
            
            self?.view?.hideLoading()
            
            switch result {
            case .success(let numberModels):
                let cellContents = numberModels.map {
                    MasterViewContent.CellContent(name: $0.name, imageUrl: $0.imageUrl)
                }
                executeOnMainThread {
                    self?.view?.display(viewContent: .init(cellContents: cellContents))
                }
                if let name = cellContents.first?.name {
                    self?.loadDetailFor(name: name, withNavigation: false)
                }
            case .failure(_):
                #warning("TODO: handle error")
            }
        }
    }
    
    func loadDetailFor(name: String, withNavigation shouldNavigate: Bool) {
        params.detailNavigationCallBack(name, shouldNavigate)
    }
}
