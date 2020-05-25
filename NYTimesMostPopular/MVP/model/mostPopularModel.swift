//
//  mostPopularModel.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

struct mostPopularModel {
    var uri: String = ""
    var url: String = ""
    var id: Int = 0
    var images = [imageModel]()
    var title = ""
    var abstract = ""
    var pubDate = ""
    var author = ""
    var source = ""
    
    
    init() {
        
    }
    
    init(dict: NSDictionary) {
        if let uri = dict["uri"] as? String {
            self.uri = uri
        }
        
        if let url = dict["url"] as? String {
            self.url = url
        }
        
        if let id = dict["id"] as? Int {
            self.id = id
        }
        
        if let mediaList = dict["media"] as? [NSDictionary],
            let firstMediaEntry = mediaList.first,
            let imagesList = firstMediaEntry["media-metadata"] as? [NSDictionary] {
            self.images = imagesList.compactMap{imageModel(dict: $0)}
        }
        
        if let title = dict["title"] as? String {
            self.title = title
        }
        
        if let abstract = dict["abstract"] as? String {
            self.abstract = abstract
        }
        
        if let byline = dict["byline"] as? String {
            self.author = byline
        }
        
        if let pubDate = dict["published_date"] as? String {
            self.pubDate = pubDate 
        }
        
        if let source = dict["source"] as? String {
            self.source = source
        }
        
        
    }
    
}



struct imageModel {
    
    var url = ""
    var format = ""
    
    init(dict: NSDictionary) {
        if let url = dict["url"] as? String {
            self.url = url
            
        }
        if let format = dict["format"] as? String {
            self.format = format
            
        }
    }
    
}
