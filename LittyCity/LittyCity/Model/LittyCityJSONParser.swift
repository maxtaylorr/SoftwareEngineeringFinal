//
//  LittyCityJSONParser.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import Foundation

class LittyCityJsonParser {
    
    class func parse(_ data: Data) -> [Bar] {
        var bars = [Bar]()
    
    if let json = try?JSONSerialization.jsonObject(with: data, options: []),
       let root = json as? [String: Any],
       let status = root["status"] as? String,
       status == "ok" {
    
        if let barArray = root["bars"] as? [Any] {
            for bar in barArray {
                if let bar = bar as? [String: String] {
                    if let name = bar["name"],
                       let phoneNumber = bar["phoneNumber"],
                       let cover = bar["cover"],
                       let address = bar["address"],
                       let city = bar["city"],
                       let state = bar["state"],
                       let barName = bar["barName"] {
                    
                       if let newBar = Bar(barName: barName, name: name, phoneNumber: phoneNumber, cover: cover, address:                     address, city: city, state: state) {
                        bars.append(newBar)
                        }
                     }
                  }
               }
            }
        }
        return bars
    }
}
