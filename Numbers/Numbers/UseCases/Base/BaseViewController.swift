//
//  BaseViewController.swift
//  Numbers
//
//  Created by Bendegúz on 2020. 09. 19..
//  Copyright © 2020. Bendegúz Németh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var activityIndicatorView: UIView?
    
    func showLoading() {
        view.isUserInteractionEnabled = false
        
        let activityIndicatorView = UIView(frame: UIScreen.main.bounds)
        activityIndicatorView.backgroundColor = .clear
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = activityIndicatorView.center
        
        executeOnMainThread {
            activityIndicatorView.addSubview(activityIndicator)
            UIApplication.shared.keyWindow?.addSubview(activityIndicatorView)
        }
        
        self.activityIndicatorView = activityIndicatorView
    }
    
    func hideLoading() {
        executeOnMainThread { [weak self] in
            self?.activityIndicatorView?.removeFromSuperview()
            self?.activityIndicatorView = nil
            
            self?.view.isUserInteractionEnabled = true
        }
    }
    
    func showError(_ error: AppError, withRetryBlock retryBlock: @escaping () -> Void) {
        let alert = UIAlertController(title: "Error",
                                      message: "An error occured (\(error.message))",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: {_ in
            retryBlock()
        }))
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
    
    func add(viewController: UIViewController, in container: UIView) {
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func remove(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
