//
//  loadder.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation
import UIKit



var vSpinner: UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        DispatchQueue.main.async {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        spinnerView.backgroundColor = .white
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            
        }
        
        vSpinner = spinnerView
    }
}
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


