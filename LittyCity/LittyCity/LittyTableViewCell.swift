//
//  LittyTableViewCell.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit

class LittyTableViewCell: UITableViewCell {

    @IBOutlet weak var barIconImageView: UIImageView!
    @IBOutlet weak var barNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
