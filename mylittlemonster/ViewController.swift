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
    @IBOutlet weak var foodImg : DragImg!
    @IBOutlet weak var heartImg : DragImg!
    
    let IMAGE_NUMBER = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray = [UIImage]()
    
        for i in 1...IMAGE_NUMBER {
            print(i)
            imageArray.append(UIImage(named: "idle\(i).png")!)
        }
        
        monsterImg.animationImages = imageArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0 //runs inifinitely
        monsterImg.startAnimating()
    }
    
    

}

