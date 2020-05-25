//
//  mostPopularViewController.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import UIKit

class mostPopularViewController: UIViewController {
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let presenter = mostPopularPresenter(mostPopularService())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x47e2c2)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        buildButtons()
        presenter.getNews()
        
        
        
    }
    
    func buildButtons() {
        
        let searchButton = UIButton.init(type: .custom)
        searchButton.setImage(UIImage(named: "Search_icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.tintColor = .white
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        let searchBarButton = UIBarButtonItem()
        searchBarButton.customView = searchButton
        
        
        let menuButton = UIButton.init(type: .custom)
        menuButton.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuButton.tintColor = .white
        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let menuBarButton = UIBarButtonItem()
        menuBarButton.customView = menuButton
        
        
        
        
        
        
        
        
        
        
        self.navigationItem.leftBarButtonItem = menuBarButton
        self.navigationItem.rightBarButtonItem = searchBarButton
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if !presenter.isViewAttached() {
            presenter.attachView(self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.detachView()
        
    }
    
    /**
       this function displays the loader while the API is loading
       - Parameter none
       - Returns: none
       */
      func displayLoader() {
          self.showSpinner(onView: self.view)
      }
      
      
      /**
       this function hides the loader when the API is done loading
       - Parameter none
       - Returns: none
       */
      func removeLoader() {
          self.removeSpinner()
      }
    
    
}




extension mostPopularViewController : mostPopularView {
    func displayNews() {
        print("test 1")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}





extension mostPopularViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.configureNewsCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    
}
