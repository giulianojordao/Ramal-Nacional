//
//  WelcomeViewController.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 6/4/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var bemvindoLabel: UIButton!
   
    @IBOutlet weak var welcomeLabel: UIButton!

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.bemvindoLabel.alpha = 0
        
        self.welcomeLabel.alpha = 0
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.bemvindoLabel.alpha = 1.0
            self.welcomeLabel.alpha = 1.0
        } )
    }
}

