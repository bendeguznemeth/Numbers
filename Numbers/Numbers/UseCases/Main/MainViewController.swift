//
//  MainViewController.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    private let mySplitViewController = UISplitViewController()
    private var myNavigationController = UINavigationController()
    private let masterViewController = UseCaseFactory.masterViewController()
    private var detailViewController = UseCaseFactory.detailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplitView()
        addNeededChildViewController()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.userInterfaceIdiom == .pad {
            disassembleChildViewControllerHierarchy()
            addNeededChildViewController()
        }
    }
    
    private func setupSplitView() {
        mySplitViewController.delegate = self
        mySplitViewController.preferredDisplayMode = .allVisible
    }
    
    private func addNeededChildViewController() {
        if isSplitViewControllerNeeded() {
            mySplitViewController.viewControllers = [UINavigationController(rootViewController: masterViewController),
                                                     UINavigationController(rootViewController: detailViewController)]
            add(viewController: mySplitViewController, in: view)
        } else {
            add(viewController: UINavigationController(rootViewController: masterViewController), in: view)
        }
    }
    
    private func isSplitViewControllerNeeded() -> Bool {
        !(UIDevice.current.userInterfaceIdiom == .pad && UIApplication.shared.statusBarOrientation.isPortrait)
    }
    
    private func disassembleChildViewControllerHierarchy() {
        remove(viewController: masterViewController)
        remove(viewController: detailViewController)
        remove(viewController: mySplitViewController)
        remove(viewController: myNavigationController)
    }
}

extension MainViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
