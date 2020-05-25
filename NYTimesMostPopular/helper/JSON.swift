//
//  JSON.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import Foundation

extension Data {
    func DataToJSON()-> NSDictionary?  {
        if let JSONData = try? JSONSerialization.jsonObject(with: self, options: []),
            let JSON = JSONData as? NSDictionary {
        
            return JSON
        } else {
            return nil
        }
    }
}
