//
//  BarObject.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import Foundation

struct Bar {
    let name: String
    let phoneNumber: String
    let cover: String
    let address: String
    let city: String
    let state: String
    let barName: BarImage
    let deal: String

    init(name: String, phoneNumber: String, cover: String, address: String, city: String, state: String, barName: BarImage,  deal: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.cover = cover
        self.address = address
        self.city = city
        self.state = state
        self.barName = barName
        self.deal = deal
    }
    
    init?(name: String, phoneNumber: String, cover: String, address: String, city: String, state: String, barName: String, deal: String) {
        if let barName = BarImage(rawValue: barName) {
            self.init(name: name, phoneNumber: phoneNumber, cover: cover, address: address, city: city, state: state, barName: barName, deal: deal)
        } else {
            return nil
        }
    }
}
