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
        case 1:
            drawCircle()
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
        // Create context - specify dimensions, opacity, and zero to match scale of screen
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        // Pull out a reference to the current context
        let context = UIGraphicsGetCurrentContext()
        
        // Create rectangle
        let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
        // Set fill color to red (convert UIColor to CGColor)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        // Set stroke color to black (convert UIColor to CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        // Set line width to 10
        CGContextSetLineWidth(context, 10)
        // Adds a CGRect rectangle to the context's current path to be drawn
        CGContextAddRect(context, rectangle)
        // Draw the context's current path using the state configured
        CGContextDrawPath(context, .FillStroke)
        
        // Get contents of the drawing as a UIImage
        let img = UIGraphicsGetImageFromCurrentImageContext()
        // End drawing
        UIGraphicsEndImageContext()
        
        // Set the image view to the image created using Core Graphics
        imageView.image = img
    }
    
    func drawCircle() {
        // Create context - specify dimensions, opacity, and zero to match scale of screen
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        // Pull out a reference to the current context
        let context = UIGraphicsGetCurrentContext()
        
        // Create rectangle
        let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
        // Set fill color to red(convert UIColor to CGColor)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        // Set stroke color to black(convert UIColor to CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        // Set line width to 10
        CGContextSetLineWidth(context, 10)
        // Adds CGRect rectangle to the context's current path to be drawn
        CGContextAddEllipseInRect(context, rectangle)
        // Draw the context's current path using the state configured
        CGContextDrawPath(context, .FillStroke)
        
        // Get contents of the drawing as a UIImage
        let img = UIGraphicsGetImageFromCurrentImageContext()
        // End drawing
        UIGraphicsEndImageContext()
        
        // Set the image created using Core Graphics as the image view
        imageView.image = img
    }
    
}

