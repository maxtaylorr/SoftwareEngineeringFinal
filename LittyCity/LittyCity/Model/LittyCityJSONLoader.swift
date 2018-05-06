//
//  LittyCityJSONLoader.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import Foundation

class LittyCityJSONLoader {
    class func load(fileName: String) ->  [Bar] {
        var bars = [Bar]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
             bars = LittyCityJsonParser.parse(data)
        }
        return bars
    }
}
