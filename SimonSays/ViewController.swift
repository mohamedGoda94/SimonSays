//
//  ViewController.swift
//  SimonSays
//
//  Created by mohamed goda on 12/26/17.
//  Copyright © 2017 mohamed goda. All rights reserved.
//

import UIKit



    class ViewController: UIViewController {
        
        @IBOutlet weak var timeLabel: UILabel!
        @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var simonLabel: UILabel!
        @IBOutlet weak var startGameButton: UIButton!
        
        var timer = Timer()
        var simonTimer = Timer()
        
        var timeInt = 20
        var scoreInt = 0
        var gameInt = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            simonLabel.layer.cornerRadius = 5
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right
            self.view.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            self.view.addGestureRecognizer(swipeLeft)
            
            let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
            swipeUp.direction = UISwipeGestureRecognizerDirection.up
            self.view.addGestureRecognizer(swipeUp)
            
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
            swipeDown.direction = UISwipeGestureRecognizerDirection.down
            self.view.addGestureRecognizer(swipeDown)
            
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func startGame(_ sender: Any) {
            
            if timeInt == 20 {
                
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                
                self.updateSimon()
                
                gameInt = 1
                
                startGameButton.isEnabled = false
                startGameButton.alpha = 0.25
                
            }
            
            if timeInt == 0 {
                
                timeInt = 20
                scoreInt = 0
                
                timeLabel.text = String("Time: \(timeInt)")
                scoreLabel.text = String("Score: \(scoreInt)")
                
                startGameButton.setTitle("Start Game", for: UIControlState.normal)
                
            }
            
        }
        
        @objc func updateTimer() {
            
            timeInt -= 1
            timeLabel.text = String("Time: \(timeInt)")
            
            if timeInt == 0 {
                
                timer.invalidate()
                simonTimer.invalidate()
                
                simonLabel.text = "Game Over"
                
                startGameButton.isEnabled = true
                startGameButton.alpha = 1.0
                
                startGameButton.setTitle("Restart", for: UIControlState.normal)
                
                gameInt = 0
                
                
            }
            
            
        }
        
        @objc func updateSimon() {
            
            let array = ["Simon Says Swipe Right",
                         "Simon Says Swipe Left",
                         "Simon Says Swipe Up",
                         "Simon Says Swipe Down",
                         "Swipe Right",
                         "Swipe Up",
                         "Swipe Down",
                         "Swipe Left",]
            
            let randomWord = Int(arc4random_uniform(UInt32(array.count)))
            simonLabel.text = array[randomWord]
            
            simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSimon), userInfo: nil, repeats: false)
            
        }
        
        @objc func swipeGestures(sender: UISwipeGestureRecognizer) {
            
            if gameInt == 1 {
                
                if sender.direction == .right {
                    
                    simonTimer.invalidate()
                    
                    if simonLabel.text == "Simon Says Swipe Right" {
                        
                        scoreInt += 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    }
                    
                }
                
                if sender.direction == .left {
                    
                    simonTimer.invalidate()
                    
                    if simonLabel.text == "Simon Says Swipe Left" {
                        
                        scoreInt += 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    }
                    
                }
                
                if sender.direction == .up {
                    
                    simonTimer.invalidate()
                    
                    if simonLabel.text == "Simon Says Swipe Up" {
                        
                        scoreInt += 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    }
                    
                }
                
                if sender.direction == .down {
                    
                    simonTimer.invalidate()
                    
                    if simonLabel.text == "Simon Says Swipe Down" {
                        
                        scoreInt += 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                        
                    } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = String("Score: \(scoreInt)")
                        
                        self.updateSimon()
                    }}}}}
