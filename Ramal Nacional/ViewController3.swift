//
//  ViewController3.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/11/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import Foundation

import UIKit

class ViewController3: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    
    var languageThree = String()
    
    @IBOutlet weak var voltarButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var recuperarButton: UIButton!
    
    @IBOutlet weak var activityIndicatorViewSenha: UIActivityIndicatorView!
        
    @IBAction func senhaButton(sender: AnyObject) {
        
        
        var error = ""
    
        if emailField.text != "" {
            
            if IJReachability.isConnectedToNetwork() {
            
            activityIndicatorViewSenha.startAnimating()
            
            performSegueWithIdentifier("senhatoweb",sender:nil)
            }
            
            else {
                
                if languageThree == "portuguese" {
                    error = "Você não está conectado à internet."
                }
                
                else if languageThree == "english" {
                    error = "You are not connected to the internet."
                }
                
            }
        }
            
            
        else {
            
            if (languageThree == "portuguese")  {
                
              error = "Por favor, digite um e-mail válido."
            }
            
            else if (languageThree == "english") {
                
              error = "Please,enter a valid e-mail."
            }
            
            var alert_2 = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert_2.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert_2,animated: true, completion: nil)
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (languageThree == "portuguese") {
            
        }
        
        else if (languageThree == "english") {
            
            
            voltarButton.setTitle("Back", forState: UIControlState.Normal)
            
            titleLabel.text = "Password Recovery"
            
            promptLabel.text = "Enter your account's e-mail."
            
            
            recuperarButton.setTitle("Recover", forState: UIControlState.Normal)
    
            
        }
        
        self.emailField.delegate = self
        
}
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "senhatoweb") {
        
        var destViewController: ViewController4 = segue.destinationViewController as! ViewController4
        
        destViewController.emailData = emailField.text
            
            
            if (languageThree == "portuguese") {
                
                destViewController.languageFour = "portuguese"
                
            }
            
            else if (languageThree == "english") {
                
                destViewController.languageFour = "english"
            }
        
        }
        
        if (segue.identifier == "senhaToInicial") {
            
            var destViewController1: ViewController = segue.destinationViewController as! ViewController
            
            if (languageThree == "portuguese") {
                
        
            destViewController1.language = "portuguese"
                
            }
            
            else if (languageThree == "english") {
                
                destViewController1.language = "english"
            }
            
        }
    }
    
       override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)  {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }


    
}