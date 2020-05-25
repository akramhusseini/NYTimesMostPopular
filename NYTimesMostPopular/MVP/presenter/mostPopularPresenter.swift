//
//  mostPopularPresenter.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation
import UIKit


protocol mostPopularView: UIViewController {
    
    func displayLoader()
    func removeLoader()
    func displayNews()
    
}


class mostPopularPresenter {
    
    private var service: mostPopularService
    weak private var view : mostPopularView?
    
    var mostPopularList = [mostPopularModel]()
    
    
    init(_ service: mostPopularService) {
           self.service = service
       }
       
    
    
    
    func getNews() {
        
        view?.displayLoader()
        
        service.getNews { (result, error) in
            self.view?.removeLoader()
            if let error = error {
                debugPrint(error.localizedDescription)
            } else if let results = result?["results"] as? [NSDictionary] {

                self.mostPopularList = results.compactMap{mostPopularModel(dict: $0)}
                
                self.view?.displayNews()
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    /**
     check if presenter View is not attached to controller
     - Parameter none
     - Returns: none
     */
    
    func isViewAttached()->Bool {
        if view == nil {
            return false
        } else {
            return true
        }
    }
    
    
    /**
     attach presenter to controller
     - Parameter none
     - Returns: none
     */
    func attachView(_ view: mostPopularView) {
        self.view = view
    }
    
    
    /**
     detach presenter from controller
     - Parameter none
     - Returns: none
     */
    func detachView() {
        self.view = nil
    }
}
