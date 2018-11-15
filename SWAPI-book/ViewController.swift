//
//  ViewController.swift
//  SWAPI-book
//
//  Created by Angelica Bato on 11/14/18.
//  Copyright © 2018 Angelica Bato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name: String?
    var hairColor: String?
    var eyeColor: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name ?? "Name"
        hairColorLabel.text = hairColor ?? "Hair Color"
        eyeColorLabel.text = eyeColor ?? "Eye Color"
        
    }

}
