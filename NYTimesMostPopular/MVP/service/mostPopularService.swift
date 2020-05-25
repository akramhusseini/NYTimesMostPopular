//
//  mostPopularService.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

class mostPopularService {
    
    
    
    
    init() {
        
    }
    
    /**
    calls API to lead news items 
    - Parameter: none
    - Returns: none
    */
    func getNews(completion: @escaping (NSDictionary?, Error?) -> Void) {
        
        
        let url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json"
        
        let Parms : [String:String] = ["api-key":"L5YbAz2Yqi0FmXILU7L1W9yYFKu2U17Z"]
        
        httpManager.get(url: url, parameters: Parms) { (result, error) in
            if let error = error {
//                debugPrint(error.localizedDescription)
                completion(nil, error)
            } else if let result = result {
                completion(result, error)
                
            }
        }
        
        
    }
    
    
    
}
