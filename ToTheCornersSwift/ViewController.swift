//
//  ViewController.swift
//  ToTheCornersSwift
//
//  Created by Ben Russell on 11/3/14.
//  Copyright (c) 2014 Ben Russell. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!
    @IBOutlet weak var bottomLeftImage: UIImageView!
    @IBOutlet weak var bottomRightView: UIImageView!
    @IBOutlet weak var centerView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide images
        topLeftImage.alpha = 0.0
        topRightImage.alpha = 0.0
        bottomLeftImage.alpha = 0.0
        bottomRightView.alpha = 0.0
        centerView.alpha = 0.0
        
        self.openingSequence()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.openingSequence()
    }

    func openingSequence()
    {
        
        self.toTheCorner(self.topLeftImage, delay: 0.0)
        self.toTheCorner(self.bottomLeftImage, delay: 1.0)
        self.toTheCorner(self.topRightImage, delay: 2.0)
        self.toTheCorner(self.bottomRightView, delay: 3.0)
        self.centerOpening(self.centerView, delay: 8.0)
    }
    

    


    
    
    
    func centerOpening(view: UIView, delay: Double)
    {
        // Mark the original center of the imaggeView
        let originalCenter = view.center
        let b = view.bounds
        
        UIView.animateWithDuration(0.7, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.8, options: .CurveEaseOut, animations: {
            
                view.bounds.size.height = b.height + b.height/3
                view.bounds.size.width = b.width + b.width/4
                view.alpha = 1.0
            }, completion: {finished in
                UIView.animateWithDuration(0.5, delay: 0.7, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
                    
                    // Shrink to original size
                    view.bounds.size.height = b.height
                    view.bounds.size.width = b.width
                }, completion: nil)
                
        })
        
    }
    
    func toTheCorner(view: UIView, delay: Double)
    {
    
        // record original position
        let originalCenter = view.center
        // record original bounds
        let b = view.bounds
        
        UIView.animateWithDuration(0.1, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .CurveEaseOut, animations: {
            
            // move view to center of screen
            view.center.x = self.view.bounds.width/2
            view.center.y = self.view.bounds.height/2
            
            }, completion: { finished in
                UIView.animateWithDuration(0.9, delay: delay + 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
                    
                    // Fade image in
                    view.alpha = 1.0
                    
                    // Increase size
                    view.bounds.size.height = b.height + b.height
                    view.bounds.size.width = b.width + b.width
                    
                    }, completion: { finished in
                        UIView.animateWithDuration(0.7, delay: delay + 1.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
                            
                            // Shrink to original size
                            view.bounds.size.height = b.height
                            view.bounds.size.width = b.width
                            
                            // Move to original position
                            view.center = originalCenter
                            }, completion: nil)})
        })
        
        
    }
    
    
}



