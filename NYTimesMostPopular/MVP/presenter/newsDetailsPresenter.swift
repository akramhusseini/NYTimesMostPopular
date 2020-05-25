//
//  newsDetailsPresenter.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/26/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

import UIKit


protocol newsDetailsView: UIViewController {
    
    func updateUI()
    
}






class newsDetailsPresenter {
    
    
    weak private var view : newsDetailsView?
    
    private var newsItem = mostPopularModel()
    
    
   
       
 
    func getNewsItem(newsItem: mostPopularModel) {
        self.newsItem = newsItem
        self.view?.updateUI()
    }
    
    /**
     check if presenter View is not attached to controller
     - Parameter none
     - Returns: none
     */
    
    
    
    
    func setBigImage(UIImageView: UIImageView)  {
        
        if let imageURL = self.newsItem.images.first(where: {$0.format == "mediumThreeByTwo440"})?.url {
            UIImageView.downloaded(from: imageURL)
        }
        
    }
    
    func setSource(label : UILabel) {
        label.text = self.newsItem.source
        
    }
    
    
    func setPublicationDate(label : UILabel) {
        label.text = self.newsItem.pubDate
    }
    
    func setByLine(label : UILabel) {
        label.text = self.newsItem.author
    }
    
    func setAbstract(label : UILabel) {
        label.text = self.newsItem.abstract
    }
    
    
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
    func attachView(_ view: newsDetailsView) {
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
