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

extension UIViewController  {
    
    func ShowLoader(){
         DispatchQueue.main.async {
            let Loader  = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
         Loader.tag = 1000
         let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
         loadingIndicator.center = Loader.center
            loadingIndicator.frame.origin.y  =  self.view.frame.height / 2
         loadingIndicator.hidesWhenStopped = true
         loadingIndicator.color = UIColor.black
         loadingIndicator.startAnimating();
         Loader.addSubview(loadingIndicator)
         
            self.view.addSubview(Loader)
         }
     }
     func dismissLoader(){
         DispatchQueue.main.async {
            self.view.viewWithTag(1000)?.removeFromSuperview()
         }
     }
    
    
}


