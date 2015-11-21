//
//  AvCorpPageViewController.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 6/26/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit

class AvCorpPageViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
 override func viewDidLoad() {
        
    let url = NSURL(string: "http://www.avcorp.com.br")
    if (url != nil) {
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        self.webView.scalesPageToFit = true
    }

}

    
    
    func webViewDidStartLoad(_: UIWebView) {
        
        activityIndicator.startAnimating()
        
        
    }
    
    func webViewDidFinishLoad(_:UIWebView) {
        activityIndicator.stopAnimating()
        
        
    }

    
    @IBAction func reload(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView.reload()
            
        }
        else {
            
            var alert = UIAlertController(title: "Ops!",message: "You are not connected to the internet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }

        
        
        
    }

    @IBAction func stop(sender: AnyObject) {
        
        webView.stopLoading()
    }
    
    
    
    @IBAction func goBack(sender: AnyObject) {
        
        
        if IJReachability.isConnectedToNetwork() {
            
            webView.goBack()
            
        }
        else {
            
            var alert = UIAlertController(title: "Ops!",message: "You are not connected to the internet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }

    }

    
    
    @IBAction func goForward(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView.goForward()
            
        }
        else {
            
            var alert = UIAlertController(title: "Ops!",message: "You are not connected to the internet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }
    }
    
    
    
    
    
}








