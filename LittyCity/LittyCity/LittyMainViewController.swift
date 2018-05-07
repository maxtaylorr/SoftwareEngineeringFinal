//
//  LittyMainViewController.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit

class LittyMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var littyCityTableView: UITableView!
    
    let barObjects = LittyCityJSONLoader.load(fileName: "bars")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Nearby Bars"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "barCell", for: indexPath)
        
        if let cell = cell as? LittyTableViewCell {
            let barObject = barObjects[indexPath.row]
            cell.barIconImageView.image = barObject.barName.image
            cell.barNameLabel.text = barObject.name
            cell.addressLabel.text = barObject.address
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LittyDetailViewController,
            let row = littyCityTableView.indexPathForSelectedRow?.row {
            destination.bar = barObjects[row]
        }
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
