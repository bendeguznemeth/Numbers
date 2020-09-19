//
//  DetailPresenter.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import Foundation

class DetailPresenter: BasePresenter {
    
    private weak var view: DetailView?
    private let numbersProvider: NumbersProviding
    private let params: DetailParams?
    
    init(view: DetailView, numbersProvider: NumbersProviding, params: DetailParams?) {
        self.view = view
        self.numbersProvider = numbersProvider
        self.params = params
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = params?.name {
            fetchData(forName: name)
        }
    }
    
    private func fetchData(forName name: String) {
        
        view?.showLoading()
        
        numbersProvider.fetchNumberDetail(forName: name) { [weak self] result in
            
            self?.view?.hideLoading()
            
            switch result {
            case .success(let numberModel):
                executeOnMainThread {
                    self?.view?.display(viewContent: .init(text: numberModel.text, imageUrl: numberModel.imageUrl))
                }
            case .failure(_):
                #warning("TODO: handle error")
            }
        }
    }
}
