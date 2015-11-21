//
//  ViewController5.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/30/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    

    @IBOutlet weak var webView3: UIWebView!
    
    @IBOutlet weak var activityIndicatorWebThree: UIActivityIndicatorView!
    
     var error = ""
    
    var urlInfo =  String()
    
    var languageFive = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (languageFive == "portuguese") {
            
            let url = NSURL(string: "\(urlInfo)/help.html")
            if (url != nil) {
            let request = NSURLRequest(URL: url!)
            webView3.loadRequest(request)
            self.webView3.scalesPageToFit = true
            }
            else {
                println("URL provided does not exist!")
            }

            
        }
        
        else if (languageFive == "english")  {
            
            let url = NSURL(string: "\(urlInfo)/help_en.html")
            if (url != nil){
            let request = NSURLRequest(URL: url!)
            webView3.loadRequest(request)
            self.webView3.scalesPageToFit = true
            }
            else{
                println("URL provided does not exist!")
            }

            
        }
    
        
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refresh(sender: AnyObject) {
        
        
        if IJReachability.isConnectedToNetwork() {
            
            webView3.reload()
            
        }
        else {
            if (languageFive == "portuguese") {
                error = "Você não está conectado à internet."
            }
                
            else if(languageFive == "english") {
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
            
        }

    }
    
    func webViewDidStartLoad(_: UIWebView) {
        
        activityIndicatorWebThree.startAnimating()
        
        
    }
    
    func webViewDidFinishLoad(_:UIWebView) {
        activityIndicatorWebThree.stopAnimating()
      
        
    }

    
    @IBAction func stopLoading(sender: AnyObject) {
        
        webView3.stopLoading()
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView3.goBack()
        }
        else {
            
            if (languageFive == "portuguese") {
                
                error = "Você não está conectado à internet."
                
            }
                
            else if (languageFive == "english") {
                
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
        }
        

    }
    
    
    @IBAction func goForward(sender: AnyObject) {
        
        if IJReachability.isConnectedToNetwork() {
            
            webView3.goForward()
        }
        else {
            
            if (languageFive == "portuguese") {
                
                error = "Você não está conectado à internet."
                
            }
                
            else if (languageFive == "english") {
                
                error = "You are not connected to the internet."
            }
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
        }

    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "ajudaToHome") {
            
            var destViewController: ViewController = segue.destinationViewController as! ViewController
            
            
            if (languageFive == "portuguese") {
                
                destViewController.language = "portuguese"
                
            }
                
            else if (languageFive == "english") {
                
                destViewController.language = "english"
            }
            
        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)  {
        self.view.endEditing(true)
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
