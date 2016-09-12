//
//  ViewController.swift
//  Project27
//
//  Created by Jeffrey Eng on 9/12/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentDrawType = 0
    
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func redrawTapped(sender: AnyObject) {
        
        // increment the currentDrawType variable to cycle to the next draw type
        currentDrawType += 1
        
        if currentDrawType > 5 {
            // reset the draw type back to the beginning of the set
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // calling drawRectangle method here so that something shows up on the screen when app loads
        drawRectangle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func drawRectangle() {
        
    }
    
}

