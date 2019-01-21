//
//  ViewController.swift
//  first attempt
//
//  Created by Calum Moir on 21/11/2018.
//  Copyright © 2018 Calum Moir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label1.layer.cornerRadius = 5.0
        button.layer.cornerRadius = 5.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        if (value == nil) {
            label2.text = "0"
        } else {
            label2.text = value
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

