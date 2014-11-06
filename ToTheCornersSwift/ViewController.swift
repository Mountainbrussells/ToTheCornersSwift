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
        
        
        
        // Make them look pretty
        topLeftImage.layer.cornerRadius = 10
        topLeftImage.layer.masksToBounds = true
        topRightImage.layer.cornerRadius = 10
        topRightImage.layer.masksToBounds = true
        bottomLeftImage.layer.cornerRadius = 10
        bottomLeftImage.layer.masksToBounds = true
        bottomRightView.layer.cornerRadius = 10
        bottomRightView.layer.masksToBounds = true
        centerView.layer.cornerRadius = 10
        centerView.layer.masksToBounds = true
        
        // hide images
        topLeftImage.alpha = 0.0
        topRightImage.alpha = 0.0
        bottomLeftImage.alpha = 0.0
        bottomRightView.alpha = 0.0
        centerView.alpha = 0.0
    
        self.openingSequence()
        
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
        self.toTheCorner(self.bottomLeftImage, delay: 0.75)
        self.toTheCorner(self.topRightImage, delay: 1.5)
        self.toTheCorner(self.bottomRightView, delay: 2.25)
        self.toTheCorner(self.centerView, delay: 3.0)
    }
    

    


    
    
    
    func centerOpening(view: UIView, delay: Double)
    {
        // Mark the original center of the imaggeView
        let originalCenter = view.center
        let b = view.bounds
        
        UIView.animateWithDuration(0.0, delay: delay, usingSpringWithDamping: 0.0, initialSpringVelocity: 30, options: nil, animations: {
            
                view.bounds.size.height = b.height + b.height/3
                view.bounds.size.width = b.width + b.width/4
                view.alpha = 1.0
            }, completion: {finished in
                UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .CurveEaseOut, animations: {
                    
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



