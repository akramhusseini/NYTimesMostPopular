//
//  newsDetailsViewController.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/26/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import UIKit

class newsDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    let presenter = newsDetailsPresenter()
    
    var newsItem : mostPopularModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         presenter.attachView(self)
        
        setupNavBarAndButtons()
        
        if let newsItem = self.newsItem {
            presenter.getNewsItem(newsItem: newsItem)
        } else {
            debugPrint("error, no news item found, exit this screen")
            self.navigationController?.popViewController(animated: false)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           if !presenter.isViewAttached() {
               presenter.attachView(self)
           }
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           presenter.detachView()
           
       }
    
    
    func setupNavBarAndButtons() {
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x47e2c2)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
    }
    
}



extension newsDetailsViewController : newsDetailsView {
  
    func updateUI() {
        presenter.setBigImage(UIImageView: storyImage)
        presenter.setSource(label: sourceLabel)
        presenter.setPublicationDate(label: publicationDateLabel)
        presenter.setByLine(label: byLineLabel)
        presenter.setAbstract(label: abstractLabel)
        
        
        
        
    }
    
 
}
