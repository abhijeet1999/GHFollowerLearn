//
//  UIViewController+Extension.swift
//  GHFollower
//
//  Created by Abhijeet Cherungottil on 1/20/25.
//

import UIKit


extension UIViewController {
    func presentGFAlertOnMainThread(title: String, messagge: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            
            let alertVc = GFSAlertVC(alertTitle: title, message: messagge, buttonTitle: buttonTitle)
            alertVc.modalPresentationStyle = .overFullScreen
            alertVc.modalTransitionStyle = .crossDissolve
            self.present(alertVc,animated: true)
        }
        
    }
}
