//
//  httpManager.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

class httpManager {
    
    static func get(url: String, parameters: [String:String], completion: @escaping (NSDictionary?, Error?)->Void) {
        
        
        
        
        if let urlQueryAllowed = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            var components = URLComponents(string: urlQueryAllowed ) {
            
            components.setQueryItems(with: parameters)
            
            if let url = components.url {
                
                var request = URLRequest(url: url)
                
                
                request.httpMethod = "GET"
                
                let session = URLSession.shared
                
                
                
                let task = session.dataTask(with: request as URLRequest, completionHandler: { data, responce, error in
                    
                    if let error = error {
                        debugPrint(error.localizedDescription)
                        completion(nil , error)
                    }
                    
                    if let responce = responce as? HTTPURLResponse,
                        200 ... 299 ~= responce.statusCode,
                        
                        let JSON = data?.DataToJSON()
                        
                    {
                        completion(JSON, nil)
                    } else {
                        completion(nil, nil)
                    }
                })
                task.resume()
            }
        }
    }
    
}
