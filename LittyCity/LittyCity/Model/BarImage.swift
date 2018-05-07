//
//  BarImage.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit

enum BarImage: String {
    case harpos
    case fh
    case shotbar
    case campus
    case roof
    case taphouse
    case gunter
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
