//
//  MasterViewController.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit
import SDWebImage

class MasterViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MasterPresenter!
    
    private var cellContents = [MasterViewContent.CellContent]()
    
    private var indexPathForSelectedRow = IndexPath(row: .zero, section: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setCellSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCellSelection()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Master"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NumberTableViewCell.self)
    }
    
    private func setCellSelection() {
        if let splitVC = splitViewController, !splitVC.isCollapsed {
            tableView.selectRow(at: indexPathForSelectedRow, animated: false, scrollPosition: .none)
        } else {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: false)
        }
    }
}

extension MasterViewController: MasterView {
    func display(viewContent: MasterViewContent) {
        cellContents = viewContent.cellContents
        tableView.reloadData()
        setCellSelection()
    }
}

extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NumberTableViewCell.self),
                                                 for: indexPath)
        
        let cellContent = cellContents[safeIndex: indexPath.row]
        
        cell.textLabel?.text = cellContent?.name
        cell.imageView?.sd_setImage(with: cellContent?.imageUrl, completed: { (_, _, _, _) in
            cell.setNeedsLayout()
        })
        
        return cell
    }
}

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        #warning("TODO: handle selection")
    }
}
