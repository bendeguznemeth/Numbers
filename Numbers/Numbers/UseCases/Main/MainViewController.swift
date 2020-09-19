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
    private let detailNavigationController = UINavigationController()
    private let masterNavigationController = UINavigationController()
    private var detailViewController = UseCaseFactory.detailViewController()
    private var masterViewController: MasterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMasterViewController()
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
            masterNavigationController.setViewControllers([masterViewController], animated: false)
            detailNavigationController.setViewControllers([detailViewController], animated: false)
            mySplitViewController.viewControllers = [masterNavigationController,
                                                     detailNavigationController]
            add(viewController: mySplitViewController, in: view)
        } else {
            masterNavigationController.setViewControllers([masterViewController], animated: false)
            add(viewController: masterNavigationController, in: view)
        }
    }
    
    private func isSplitViewControllerNeeded() -> Bool {
        !(UIDevice.current.userInterfaceIdiom == .pad && UIApplication.shared.statusBarOrientation.isPortrait)
    }
    
    private func disassembleChildViewControllerHierarchy() {
        remove(viewController: masterViewController)
        remove(viewController: detailViewController)
        remove(viewController: masterNavigationController)
        remove(viewController: detailNavigationController)
        remove(viewController: mySplitViewController)
    }
    
    private func createMasterViewController() {
        let params = MasterParams(detailNavigationCallBack: { [weak self] (name, shouldNavigate) in
            guard let self = self else { return }
            
            executeOnMainThread {
                let detailViewController = UseCaseFactory.detailViewController(withParams: .init(name: name))
                self.detailViewController = detailViewController
                self.detailNavigationController.setViewControllers([self.detailViewController], animated: false)
                
                if shouldNavigate {
                    if self.isSplitViewControllerNeeded() {
                        self.mySplitViewController.showDetailViewController(self.detailNavigationController, sender: self)
                    } else {
                        self.masterNavigationController.pushViewController(detailViewController, animated: true)
                    }
                } else {
                    self.mySplitViewController.viewControllers = [self.masterNavigationController,
                                                                  self.detailNavigationController]
                }
            }
        })
        
        masterViewController = UseCaseFactory.masterViewController(withParams: params)
    }
}

extension MainViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
