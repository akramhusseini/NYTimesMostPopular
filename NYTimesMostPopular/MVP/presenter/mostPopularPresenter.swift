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
    
    private var mostPopularList = [mostPopularModel]()
    
    
    init(_ service: mostPopularService) {
           self.service = service
       }
       
    
    
    /**
      check API on new york times and load it
      - Parameter none
      - Returns: none
      */
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
    
    
    
    func getNewsItem(indexPath: IndexPath) -> mostPopularModel {
        return mostPopularList[indexPath.row]
    }
    
    
    
    /**
      configure and return a news cell
      - Parameter tableView, indexPath
      - Returns: mostPopularCell
      */
    func configureNewsCell(tableView: UITableView, indexPath: IndexPath) -> mostPopularCell? {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mostPopularCell", for: indexPath) as? mostPopularCell {
            
            if let imageURL = self.mostPopularList[indexPath.row].images.first(where: {$0.format == "Standard Thumbnail"})?.url {
                cell.itemImageView.downloaded(from: imageURL)
            }
            
            cell.entryTitle.text = self.mostPopularList[indexPath.row].title
            cell.content.text = self.mostPopularList[indexPath.row].abstract
            cell.authorLabel.text = self.mostPopularList[indexPath.row].author
            cell.timeLabel.text = self.mostPopularList[indexPath.row].pubDate
            
            cell.selectionStyle = .none
            
            
            return cell
        } else {
            
            return nil
        }
    }
    
    func getNewsCount() -> Int {
        return mostPopularList.count
    }
    
    
    
    /**
      generate right bar button items
      - Parameter none
      - Returns: UIBarButtonItem
      */
    func getRightBarButtons()->[UIBarButtonItem] {
        
        let searchButton = UIButton.init(type: .custom)
        searchButton.setImage(UIImage(named: "Search_icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.tintColor = .white
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

      
        
        let kebabButton = UIButton.init(type: .custom)
        kebabButton.setImage(UIImage(named: "kebab")?.withRenderingMode(.alwaysTemplate), for: .normal)
        kebabButton.tintColor = .white
        kebabButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        
        let searchBarButton = UIBarButtonItem()
              searchBarButton.customView = searchButton
        let kekbabBarBUtton = UIBarButtonItem()
        kekbabBarBUtton.customView = kebabButton
        
        return [ kekbabBarBUtton, searchBarButton ]
        
        
        
    }
    
    
    
    /**
     generate left bar button items
     - Parameter none
     - Returns: UIBarButtonItem
     */
    func getLeftBarButtons() -> UIBarButtonItem {
    let menuButton = UIButton.init(type: .custom)
           menuButton.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), for: .normal)
           menuButton.tintColor = .white
           menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           let menuBarButton = UIBarButtonItem()
           menuBarButton.customView = menuButton
           return menuBarButton
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
