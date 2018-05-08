//
//  LittyCityJSONParser.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import Foundation

class LittyCityJSONParser {
    
    class func parse(_ data: Data) -> [Bar] {
        var barObjects = [Bar]()
    
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
    
        if let bars = root["bars"] as? [Any] {
            for bar in bars {
                if let bar = bar as? [String: String] {
                    if let name = bar["name"],
                       let phoneNumber = bar["phone"],
                       let cover = bar["cover"],
                       let address = bar["address"],
                       let barName = bar["barName"],
                       let deal = bar["deal"] {
                        if let newBar = Bar(name: name, phoneNumber: phoneNumber, cover: cover, address:                     address, barName: barName, deal: deal) {
                        barObjects.append(newBar)
                        }
                     }
                  }
               }
            }
        }
        return barObjects
    }
}
