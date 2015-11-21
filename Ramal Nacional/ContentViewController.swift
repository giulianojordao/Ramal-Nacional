//
//  ContentViewController.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 6/4/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var pageIndex: Int!
    var titleIndex: String!
    var imageFile: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageView.image = UIImage(named: self.imageFile)
        self.label.text = self.titleIndex
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


 