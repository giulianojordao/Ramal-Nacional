//
//  AdminViewController.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 6/7/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit


class AdminViewController: UIViewController,UITextFieldDelegate {
    
    var languageAdmin = String()
    
    var avCorpURL = "http://www.ramalnacional.com.br/mobile"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var backLabel: UIButton!
    
    @IBOutlet weak var urlTextField: UITextField!
        
    @IBOutlet weak var reconfigLabel: UIButton!
    
    @IBOutlet weak var ajudaTextField: UITextField!
    
    @IBOutlet weak var helpTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var errorAdminView = ""
    
    
    @IBAction func tutorialButton(sender: AnyObject) {
        
        
        if (segmentedControl.selectedSegmentIndex == 0) {
        self.performSegueWithIdentifier("tutorialPort",sender:nil)
        }
        else if (segmentedControl.selectedSegmentIndex == 1) {
            
        
        self.performSegueWithIdentifier("tutorialEng",sender:nil)
        }
        
    }
    
    @IBAction func reconfigButton(sender: AnyObject) {
        
        
        urlTextField.text = avCorpURL
        
        let urlField: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        urlField.setObject(urlTextField.text, forKey: "urlText")

    }
    
    
    @IBAction func entrarButton(sender: AnyObject) {
        

    
        let urlField: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if urlTextField.text != "" {
            
            urlField.setObject(urlTextField.text, forKey: "urlText")
            
        }
            
        else
            
        {
            
            if (segmentedControl.selectedSegmentIndex == 1) {
                
                errorAdminView = "Please, enter a valid URL."
                
                }
                
            else if (segmentedControl.selectedSegmentIndex == 0) {
                
                errorAdminView = "Por favor, digite uma URL válida."
                

                }
            
            
            
            
        }
        
        urlField.synchronize()
        
        
        
        
        
        
        if errorAdminView != "" {
            
            var alertAdminView = UIAlertController(title: "Ops!",message: errorAdminView, preferredStyle: UIAlertControllerStyle.Alert)
            
            alertAdminView.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alertAdminView,animated: true, completion: nil)
            
            
        }

        
      
        
        
    }
    override func viewDidLoad() {
        
    super.viewDidLoad()
       
      
         let urlField: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        if let filledURL: AnyObject = urlField.objectForKey("urlText") {
            
            urlTextField.text = urlField.objectForKey("urlText") as! String
        }
            
        else {
            urlTextField.text = avCorpURL
        }

        
        
        if languageAdmin == "portuguese" {
            
            segmentedControl.selectedSegmentIndex == 0
            
            titleLabel.text = "Configurações"
            
            instructionsLabel.text = "Entre com a URL do servidor A2Billing."
            
            buttonLabel.setTitle("Salvar", forState: UIControlState.Normal)
  
            backLabel.setTitle("Voltar", forState: UIControlState.Normal)
            
            reconfigLabel.setTitle("Reconfigurar", forState: UIControlState.Normal)
        }
        
        else if languageAdmin == "english" {
            
            segmentedControl.selectedSegmentIndex == 1
            
            titleLabel.text = "Settings"
            
            instructionsLabel.text = "Enter your A2Billing server's URL."
            
            buttonLabel.setTitle("Save", forState: UIControlState.Normal)
            
            backLabel.setTitle("Back", forState: UIControlState.Normal)
            
            reconfigLabel.setTitle("Reset", forState: UIControlState.Normal)
            
        }
        
        
        
        
    var defaultsLanguageAdmin : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let languageChoice: AnyObject = defaultsLanguageAdmin.objectForKey("state") {
            
            segmentedControl.selectedSegmentIndex = defaultsLanguageAdmin.objectForKey("state") as! Int
        }

    
           self.urlTextField.delegate = self
        
    }
    
    
    @IBAction func changeLanguage(sender: AnyObject) {
        
        
        
        var defaultsLanguageAdmin : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        
        
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            
            defaultsLanguageAdmin.setObject(segmentedControl.selectedSegmentIndex, forKey: "state")
            
            titleLabel.text = "Configurações"
            
            instructionsLabel.text = "Entre com a URL do servidor A2Billing."
            
            buttonLabel.setTitle("Salvar", forState: UIControlState.Normal)
            
            backLabel.setTitle("Voltar", forState: UIControlState.Normal)
            
            reconfigLabel.setTitle("Reconfigurar", forState: UIControlState.Normal)
            
            
        case 1:
            
            
            defaultsLanguageAdmin.setObject(segmentedControl.selectedSegmentIndex, forKey: "state")
            
            titleLabel.text = "Settings"
            
            instructionsLabel.text = "Enter your A2Billing server's URL."
            
            buttonLabel.setTitle("Save", forState: UIControlState.Normal)
            
            backLabel.setTitle("Back", forState: UIControlState.Normal)
            
            reconfigLabel.setTitle("Reset", forState: UIControlState.Normal)
            
        default: 0
        
        defaultsLanguageAdmin.synchronize()
        
        break;
            
            
        }
        
        

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "adminToPrincipal") {
            
            var destViewControllerPrincipal: ViewController = segue.destinationViewController as! ViewController
            
            destViewControllerPrincipal.urlServer = urlTextField.text
            
            if (segmentedControl.selectedSegmentIndex == 0) {
            destViewControllerPrincipal.language = "portuguese"
            }
            
            else if (segmentedControl.selectedSegmentIndex == 1) {
                destViewControllerPrincipal.language = "english"
            }
        }
        
        
  
    }
    

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)  {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        urlTextField.resignFirstResponder()
        
        return true
    }

    
    
}

    
    



