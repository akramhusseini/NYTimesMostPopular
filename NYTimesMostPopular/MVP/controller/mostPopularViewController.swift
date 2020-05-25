//
//  mostPopularViewController.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import UIKit

class mostPopularViewController: UIViewController {
    
    
    
    
    let presenter = mostPopularPresenter(mostPopularService())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
        
        presenter.getNews()
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if !presenter.isViewAttached() {
            presenter.attachView(self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.detachView()
        
    }
    
    
}




extension mostPopularViewController : mostPopularView {
    func displayNews() {
        print("test 1")
    }
}
