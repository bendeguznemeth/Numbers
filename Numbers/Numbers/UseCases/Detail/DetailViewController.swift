//
//  DetailViewController.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var presenter: DetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        presenter.viewDidLoad()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Detail"
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }
}

extension DetailViewController: DetailView {
    func display(viewContent: DetailViewContent) {
        label.text = viewContent.text
        imageView.sd_setImage(with: viewContent.imageUrl)
    }
}
