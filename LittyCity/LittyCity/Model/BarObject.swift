//
//  BarObject.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import Foundation

struct Bar {
    let barName: BarImage
    let name: String
    let phoneNumber: String
    let cover: String
    let address: String
    let city: String
    let state: String

    init(barName: BarImage, name: String, phoneNumber: String, cover: String, address: String, city: String, state: String) {
        self.barName = barName
        self.name = name
        self.phoneNumber = phoneNumber
        self.cover = cover
        self.address = address
        self.city = city
        self.state = state
    }
    
    init?(barName: String, name: String, phoneNumber: String, cover: String, address: String, city: String, state: String) {
        if let barName = BarImage(rawValue: barName) {
            self.init(barName: barName, name: name, phoneNumber: phoneNumber, cover: cover, address: address, city: city, state: state)
        } else {
            return nil
        }
    }
}
