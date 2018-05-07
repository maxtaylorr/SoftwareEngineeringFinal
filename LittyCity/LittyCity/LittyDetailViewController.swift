//
//  LittyDetailViewController.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit

class LittyDetailViewController: UIViewController {

    var bar: Bar?
    
    @IBOutlet weak var dealLabel: UILabel!
    @IBOutlet weak var coverLabel: UILabel!
    @IBOutlet weak var barNameLabel: UILabel!
    @IBOutlet weak var barIconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        
        barIconImageView.image = bar?.barName.image
        barNameLabel.text = bar?.name
        coverLabel.text = bar?.cover
        dealLabel.text = bar?.deal

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
