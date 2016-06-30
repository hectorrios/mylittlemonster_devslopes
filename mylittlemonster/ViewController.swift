//
//  ViewController.swift
//  mylittlemonster
//
//  Created by Hector Rios on 21/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg : MonsterImg!
    @IBOutlet weak var foodImg : DragImg!
    @IBOutlet weak var heartImg : DragImg!
    
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    
    let IMAGE_NUMBER = 4
    let DIM_ALPHA : CGFloat = 0.2
    let OPAQUE : CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0;
    var timer : NSTimer!
    
    var monsterHappy = false
    var currentItem : UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.penalty1Img.alpha = DIM_ALPHA
        self.penalty2Img.alpha = DIM_ALPHA
        self.penalty3Img.alpha = DIM_ALPHA
    
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        foodImg.dropTarget = self.monsterImg
        heartImg.dropTarget = self.monsterImg
        
        startTimer()
        
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
    }
    
    func startTimer() {
        
        stopTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if timer != nil {
            timer.invalidate() //reset timer
        }
    }
    
    
    func changeGameState() {
        
        if (!monsterHappy) {
            penalties += 1
            
            if penalties == 1 {
                self.penalty1Img.alpha = OPAQUE
                self.penalty2Img.alpha = DIM_ALPHA
            } else if penalties == 2 {
                self.penalty2Img.alpha = OPAQUE
                self.penalty3Img.alpha = DIM_ALPHA
            } else if penalties >= 3 {
                self.penalty3Img.alpha = OPAQUE
            } else {
                self.penalty1Img.alpha = DIM_ALPHA
                self.penalty2Img.alpha = DIM_ALPHA
                self.penalty3Img.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES {
                self.gameOver()
                return
            }
        }
        
        let rand = arc4random_uniform(2); //0 or 1
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        } else {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        }
        
        currentItem = rand
        monsterHappy = false
        
        
    }
    
    func gameOver() {
        stopTimer()
        self.monsterImg.playDeathAnimation()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        
    }
    
    

}

