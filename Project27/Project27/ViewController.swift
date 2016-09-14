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
        case 2:
            drawCheckerboard()
        case 3:
            drawRotatedSquares()
        case 4:
            drawLines()
        case 5:
            drawImagesAndText()
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
        let rectangle = CGRect(x: 5, y: 5, width: 502, height: 502)
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
    
    func drawCheckerboard() {
        // Create context - specify dimensions, opacity, and scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        // Pull out a reference to the current context
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        
        for row in 0 ..< 8 {
            for col in 0 ..< 8 {
                if row % 2 == 0 {
                    if col % 2 == 0 {
                    CGContextFillRect(context, CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                } else {
                    if col % 2 == 1 {
                        CGContextFillRect(context, CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        
        // Get contents of the drawing as a UIImage
        let img = UIGraphicsGetImageFromCurrentImageContext()
        // End drawing
        UIGraphicsEndImageContext()
        
        // Set the image created using Core Graphics as the image view
        imageView.image = img
    }
    
    func drawRotatedSquares() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 256, 256)
        
        let rotations = 16
        let amount = M_PI_2 / Double(rotations)
        
        for _ in 0 ..< rotations {
            CGContextRotateCTM(context, CGFloat(amount))
            CGContextAddRect(context, CGRect(x: -128, y: -128, width: 256, height: 256))
        }
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    func drawLines() {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 256, 256)
        
        var first = true
        var length: CGFloat = 256
        
        for _ in 0 ..< 256 {
            CGContextRotateCTM(context, CGFloat(M_PI_2))
            
            if first {
                CGContextMoveToPoint(context, length, 50)
                first = false
            } else {
                CGContextAddLineToPoint(context, length, 50)
            }
            
            length *= 0.99
        }
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
    
    func drawImagesAndText() {
        // 1) Create a context, but this time we don't need a reference to it
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        
        // 2) Define a paragraph style that aligns text to the center
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        // 3) Create an attributes dictionary containing that paragraph style, and also a font
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 36)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        // 4) Draw a string to the screen using the attributes dictionary
        let string: NSString = "The best-laid schemes o'\nmice an' men gang aft agley"
        string.drawWithRect(CGRect(x: 32, y: 32, width: 448, height: 448), options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)
        
        // 5) Load an image from the project and draw it to the context
        let mouse = UIImage(named: "mouse")
        mouse?.drawAtPoint(CGPoint(x: 300, y: 150))
        
        // 6) Retrieve a UIImage of the context's data, then end drawing.
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 7) Update the image view with the finished result.
        imageView.image = img
    }
}

