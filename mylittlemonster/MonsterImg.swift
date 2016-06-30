//
//  MonsterImg.swift
//  mylittlemonster
//
//  Created by Hector Rios on 4/10/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    let IDLE_IMAGES_NUMBER = 4
    let DEATH_IMAGES_NUMBER = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    /**
     plays an idle animation for our monster.
     */
    func playIdleAnimation() {
        
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imageArray = [UIImage]()
        
        for i in 1...IDLE_IMAGES_NUMBER {
            print(i)
            imageArray.append(UIImage(named: "idle\(i).png")!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0 //runs inifinitely
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imageArray = [UIImage]()
        
        for i in 1...DEATH_IMAGES_NUMBER {
            print(i)
            imageArray.append(UIImage(named: "dead\(i).png")!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1 //just run once
        self.startAnimating()

    }
    
}
