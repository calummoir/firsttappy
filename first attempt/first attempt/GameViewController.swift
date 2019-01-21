//
//  GameViewController.swift
//  first attempt
//
//  Created by Calum Moir on 21/11/2018.
//  Copyright © 2018 Calum Moir. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var countdownLabel: UILabel!

    @IBOutlet var button: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    var tapInt = 0
    
    var startInt = 3
    var startTimer = Timer()
    
    var countdownInt = 10
    
    var recordData:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius = 5.0
        label2.layer.cornerRadius = 5.0
        button.layer.cornerRadius = 5.0
        
        tapInt = 0
        scoreLabel.text = String(tapInt)
        
        startInt = 3
        button.setTitle(String(startInt), for: .normal)
        button.isEnabled = false
        
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTimer), userInfo: nil, repeats: true)
        
        countdownInt = 10
        countdownLabel.text = String(countdownInt)
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func tapMeButton(_ sender: Any) {
        tapInt += 1
        scoreLabel.text = String(tapInt)
    }
    
    @objc func startGameTimer() {
        startInt -= 1
        button.setTitle(String(startInt), for: .normal)
        if startInt == 0 {
            startTimer.invalidate()
            button.setTitle("Tap Me", for: .normal)
            button.isEnabled = true
            startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startCountdownTimer), userInfo: nil, repeats: true)
        }
    }
    @objc func startCountdownTimer() {
        countdownInt -= 1
        countdownLabel.text = String(countdownInt)
        if countdownInt == 0 {
            startTimer.invalidate()
            
            if (recordData == nil) {
                let savedString = scoreLabel.text
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(savedString, forKey: "Record")
            } else {
                let score:Int? = Int(scoreLabel.text!)
                let record:Int? = Int(recordData)
                
                if (score! > record!) {
                    let savedString = scoreLabel.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(savedString, forKey: "Record")
                }
            }

            button.setTitle("Game Over!", for: .normal)
            button.isEnabled = false
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
         }
    }
    
    @objc func end() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! EndViewController
        vc.scoreData = scoreLabel.text
        self.present(vc, animated: false, completion: nil)
    }
 
}
