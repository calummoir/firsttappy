//
//  EndViewController.swift
//  first attempt
//
//  Created by Calum Moir on 17/01/2019.
//  Copyright © 2019 Calum Moir. All rights reserved.
//

import UIKit
import Social

class EndViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    var scoreData: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label1.layer.cornerRadius = 5.0
        label2.layer.cornerRadius = 5.0
        button1.layer.cornerRadius = 5.0
        button2.layer.cornerRadius = 5.0
        button3.layer.cornerRadius = 5.0
        button4.layer.cornerRadius = 5.0
        
        scoreLabel.text = scoreData
    }
    
    @IBAction func restartGame(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func shareTwitter(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter.setInitialText(scoreLabel.text)
        }
    }
}
