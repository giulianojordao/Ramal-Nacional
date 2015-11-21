//
//  ViewController2.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/10/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import Foundation

import UIKit


class ViewController2: UIViewController {
    
    var languageTwo = String()
    
    var urlSent = String()
    
    var error = ""
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityIndicatorWeb: UIActivityIndicatorView!
    
    var user = String()
    
    var pass = String()
    
    override func viewDidLoad() {
        
        var post: NSString = "pr_login=\(user)&pr_password=\(pass)&done=submit_log"
        
        var url: NSURL = NSURL(string: "\(urlSent)")!
        
        var postData: NSData = post.dataUsingEncoding(NSUTF8StringEncoding)!
        
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        var postLength:NSString = String( postData.length )
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = postData
        
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var reponseError: NSError?
        var response: NSURLResponse?
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
        
        if ( urlData != nil ) {
            let res = response as! NSHTTPURLResponse!;
            
            NSLog("Response code: %ld", res.statusCode);
            
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                
                NSLog("Response ==> %@", responseData);
                
                var error: NSError?
                
                
            }
            
        }
        webView.loadRequest(request)
        
        
        
        
    }
    
    func webViewDidStartLoad(_: UIWebView) {
        
        activityIndicatorWeb.startAnimating()
        
        
    }
    
    func webViewDidFinishLoad(_:UIWebView) {
        activityIndicatorWeb.stopAnimating()
        
        
    }

    @IBAction func stopB(sender: AnyObject) {
        
        webView.stopLoading()
    }
    
    
    @IBAction func reloadB(sender: AnyObject) {
        
        
        if IJReachability.isConnectedToNetwork() {
        
        webView.reload()
        }
        else {
            
            if (languageTwo == "portuguese") {
                
                error = "Você não está conectado à internet."
                
            }
            
            else if (languageTwo == "english") {
                
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
        }
                
            
    
    }
    
    
    @IBAction func backB(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView.goBack()
        }
        else {
            
            if (languageTwo == "portuguese") {
                
                error = "Você não está conectado à internet."
                
            }
                
            else if (languageTwo == "english") {
                
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
        }
        

    }
    
    
    @IBAction func forwardB(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView.goForward()
        }
        else {
            
            if (languageTwo == "portuguese") {
                
                error = "Você não está conectado à internet."
                
            }
                
            else if (languageTwo == "english") {
                
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
        }
        

    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "home") {
            
            var destViewController: ViewController = segue.destinationViewController as! ViewController
            
            
            if (languageTwo == "portuguese") {
                
                destViewController.language = "portuguese"
                
            }
                
            else if (languageTwo == "english") {
                
                destViewController.language = "english"
            }
            
        }
    
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)  {
        self.view.endEditing(true)
    }


}