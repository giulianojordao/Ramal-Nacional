//
//  ViewController4.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/11/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import Foundation

import UIKit


class ViewController4: UIViewController {
    
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var error = ""
    
    @IBOutlet weak var webView2: UIWebView!
    
    @IBOutlet weak var voltarButton: UIBarButtonItem!
    
    var languageFour = String()
    
    var emailData = String()
    
    override func viewDidLoad() {
        
        if (languageFour == "portuguese") {
            
        }
        
        else if (languageFour == "english") {
            
         
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var post: NSString = "pr_email=\(emailData)"
        
        var url: NSURL = NSURL(string: "http://web.ramalnacional.com.br/customer/forgotpassword.php?action=email")!
        
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
        webView2.loadRequest(request)
        
        
    }
    
    
    @IBAction func stopB(sender: AnyObject) {
        
        webView2.stopLoading()
    }
    
    
    @IBAction func reloadB(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView2.reload()
            
        }
        else {
            if (languageFour == "portuguese") {
                error = "Você não está conectado à internet."
            }
            
            else if(languageFour == "english") {
                error = "You are not connected to the internet."
            }
            
                var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
                
                self.presentViewController(alert,animated: true, completion: nil)
                
                
            
        }

        
        
        
    }
    
    func webViewDidStartLoad(_: UIWebView) {
        
        activityIndicator.startAnimating()
        
        
    }
    
    func webViewDidFinishLoad(_:UIWebView) {
        activityIndicator.stopAnimating()
        
        
    }

    
    
    @IBAction func backB(sender: AnyObject) {
        
        
        if IJReachability.isConnectedToNetwork() {
            
            webView2.goBack()
            
        }
        else {
            if (languageFour == "portuguese") {
                error = "Você não está conectado à internet."
            }
                
            else if(languageFour == "english") {
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }

    }
    
    
    @IBAction func forwardB(sender: AnyObject) {
        
        
        if IJReachability.isConnectedToNetwork() {
            
            webView2.goForward()
            
        }
        else {
            if (languageFour == "portuguese") {
                error = "Você não está conectado à internet."
            }
                
            else if(languageFour == "english") {
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "home2") {
            
            var destViewController: ViewController3 = segue.destinationViewController as! ViewController3
            
            
            if (languageFour == "portuguese") {
                
                destViewController.languageThree = "portuguese"
                
            }
                
            else if (languageFour == "english") {
                
                destViewController.languageThree = "english"
            }
            
        }
    
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)  {
        self.view.endEditing(true)
    }


}