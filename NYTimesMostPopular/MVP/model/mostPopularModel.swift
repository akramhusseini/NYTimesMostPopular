//
//  mostPopularModel.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

struct mostPopularModel : Codable {
    var uri: String = ""
    var url: String = ""
    var id: Int = 0
    
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
    }
    
}
