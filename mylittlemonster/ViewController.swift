//
//  ViewController.swift
//  mylittlemonster
//
//  Created by Hector Rios on 21/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray = [UIImage]()
        for var i=1; i <= 4; i++ {
            imageArray.append(UIImage(named: "idle\(i).png")!)
        }
        
        monsterImg.animationImages = imageArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0 //runs inifinitely
        monsterImg.startAnimating()
    }

}

