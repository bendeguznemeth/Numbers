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
}
