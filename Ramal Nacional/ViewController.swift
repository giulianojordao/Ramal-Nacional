//
//  ViewController.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/9/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController,UITextFieldDelegate {
    
    var language = String()
    
    var urlServer =  String()
    
    var urlAvCorp = "http://www.ramalnacional.com.br/mobile"
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var credenciaisLabel: UILabel!
    
    @IBOutlet weak var entrarButtonLabel: UIButton!
   
    @IBOutlet weak var forgotButton: UIButton!
   
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var ajudaButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var servertextField: UITextField!
    

    @IBAction func entrarButton(sender: AnyObject) {
        
        
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        
        var credentials = NSEntityDescription.insertNewObjectForEntityForName("Users",inManagedObjectContext:context) as! NSManagedObject
        
        var error = ""
    
        if usernameField.text != ""
        {
            credentials.setValue(usernameField.text,forKey: "username")
        }
        
        else
            
        {
            if (segmentedControl.selectedSegmentIndex == 1){
                
            error = "Please, enter a valid username."
                
            }
            
            else if (segmentedControl.selectedSegmentIndex == 0) {
                
            error = "Por favor, digite um usuário válido."
        }
            
        }
        
        
        if passwordField.text != ""
        {
            credentials.setValue(passwordField.text, forKey: "password")
        }
        
        else
        {
            if (segmentedControl.selectedSegmentIndex == 1){
                
                error = "Please, enter a valid password."
            }

            else if (segmentedControl.selectedSegmentIndex == 0) {

            error = "Por favor, digite uma senha válida."
        }
        }
        
        context.save(nil)

        if usernameField.text == "" && passwordField.text == "" {
            
            if (segmentedControl.selectedSegmentIndex == 1){
                
                error = "Please, enter your credentials."
            }

            else if (segmentedControl.selectedSegmentIndex == 0) {

            
            error = "Por favor, entre com suas credenciais. "
        }
            
        }

        
        if IJReachability.isConnectedToNetwork() {
            
            if usernameField.text != "" && passwordField.text != ""  {
                
            activityIndicator.startAnimating()

            
            self.performSegueWithIdentifier("principal",sender:nil)
            }
            
            
        }
        
        else{
            if (segmentedControl.selectedSegmentIndex == 1){
                
                error = "You are not connected to the internet."
            }

            else if (segmentedControl.selectedSegmentIndex == 0) {

            
            error = "Você não está conectado à internet."
            }
        }
        
        
        
     
        if error != "" {
            
            var alert = UIAlertController(title: "Ops!",message: error, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",style: .Default, handler: nil ))
            
            self.presentViewController(alert,animated: true, completion: nil)
            
            
        }

    
    }
 
    @IBAction func changeLanguage(sender: AnyObject) {
        
        var defaultsLanguage : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            
            
            defaultsLanguage.setObject(segmentedControl.selectedSegmentIndex, forKey: "state")
            
            credenciaisLabel.text = "Por favor, entre com as suas credenciais."
            
            let placeholderText = "Usuário"
            
            usernameField.placeholder = placeholderText
            
            let placeholderTextSenha = "Senha"
            
            passwordField.placeholder = placeholderTextSenha
            
            entrarButtonLabel.setTitle("Entrar", forState: UIControlState.Normal)
            
            forgotButton.setTitle("Esqueceu sua senha?", forState: UIControlState.Normal)
            
            ajudaButton.setTitle("Ajuda", forState: UIControlState.Normal)
            
         
            
            
        case 1:
            
            defaultsLanguage.setObject(segmentedControl.selectedSegmentIndex, forKey: "state")
           
            credenciaisLabel.text = "Please, enter you credentials."
            
            let placeholderText = "Username"
            
            usernameField.placeholder = placeholderText
            
            let placeholderTextSenha = "Password"
            
            passwordField.placeholder = placeholderTextSenha
            
            entrarButtonLabel.setTitle("Log In", forState: UIControlState.Normal)
            
            forgotButton.setTitle("Forgot your password?", forState: UIControlState.Normal)
            
            ajudaButton.setTitle("Help", forState: UIControlState.Normal)
            
            
            
            
        default: 0
        
        defaultsLanguage.synchronize()
        
        break;
            
        
        }
        
        

    }

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        var serverDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
        
        if urlServer != "" {
            
            serverDefaults.setObject(urlServer, forKey: "serverURL")
            
        }
        
        else {
            
            serverDefaults.setObject(urlAvCorp, forKey: "serverURLd")
            
            
        }
        
        
       var serverURLSaved = serverDefaults.valueForKey("serverURL") as? String
        
        if serverURLSaved != nil {
            
            servertextField.text = serverURLSaved
        }
        
        else {
            
            servertextField.text =  urlAvCorp
        }
        
        
        var defaultsLanguage : NSUserDefaults = NSUserDefaults.standardUserDefaults()

        if let languageChoice: AnyObject = defaultsLanguage.objectForKey("state") {
            
            segmentedControl.selectedSegmentIndex = defaultsLanguage.objectForKey("state") as! Int
        }
    
        
        if language == "english" {
            
            var defaultsLanguage : NSUserDefaults = NSUserDefaults.standardUserDefaults()

            segmentedControl.selectedSegmentIndex = 1
            
            defaultsLanguage.setValue(segmentedControl.selectedSegmentIndex, forKey: "state")
            
            defaultsLanguage.synchronize()
       

        }
        else if language == "portuguese" {
            
            var defaultsLanguage : NSUserDefaults = NSUserDefaults.standardUserDefaults()

            segmentedControl.selectedSegmentIndex = 0
            
            defaultsLanguage.setValue(segmentedControl.selectedSegmentIndex, forKey: "state")
           
            defaultsLanguage.synchronize()
            

            
            
        }
        
        println(defaultsLanguage.valueForKey("state"))
        
        println(language)

        
        if segmentedControl.selectedSegmentIndex == 0  {
            
            
            credenciaisLabel.text = "Por favor, entre com as suas credenciais."
            
            let placeholderText = "Usuário"
            
            usernameField.placeholder = placeholderText
            
            let placeholderTextSenha = "Senha"
            
            passwordField.placeholder = placeholderTextSenha
            
            entrarButtonLabel.setTitle("Entrar", forState: UIControlState.Normal)
            
            forgotButton.setTitle("Esqueceu sua senha?", forState: UIControlState.Normal)
            
            ajudaButton.setTitle("Ajuda", forState: UIControlState.Normal)
            
            
           
        }
        
        else if segmentedControl.selectedSegmentIndex == 1  {
            
            credenciaisLabel.text = "Please, enter you credentials."
            
            let placeholderText = "Username"
            
            usernameField.placeholder = placeholderText
            
            let placeholderTextSenha = "Password"
            
            passwordField.placeholder = placeholderTextSenha
            
            entrarButtonLabel.setTitle("Log In", forState: UIControlState.Normal)
            
            forgotButton.setTitle("Forgot your password?", forState: UIControlState.Normal)
            
            ajudaButton.setTitle("Help", forState: UIControlState.Normal)
            
        
        }
        
        self.passwordField.delegate = self
        
        self.usernameField.delegate = self
   
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        var results: NSArray = context.executeFetchRequest(request,error:nil)!
        
        if(results.count>0) {
            
            let lastItem = (results.count) - 1
            
            let res = results[lastItem] as! NSManagedObject
            
            if res.valueForKey("username") != nil {
                
                usernameField.text = res.valueForKey("username") as! String
                
            }
            
            if res.valueForKey("password") != nil {
                
                passwordField.text = res.valueForKey("password") as! String
            }
            
                       
        }
        
        else {
            
            usernameField.text = ""
            passwordField.text = ""
            
        }
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
         if (segue.identifier == "principal") {
    
            
        var destViewController2: ViewController2 = segue.destinationViewController as! ViewController2
    
        
        destViewController2.user = usernameField.text
        destViewController2.pass = passwordField.text
        destViewController2.urlSent = servertextField.text!

            
            if (segmentedControl.selectedSegmentIndex == 0) {
                
                destViewController2.languageTwo = "portuguese"
                
            }
            
            else if (segmentedControl.selectedSegmentIndex == 1) {
                
                destViewController2.languageTwo = "english"
            }
        }
    
        if (segue.identifier == "recuperarSenha") {
            
            var destViewController3: ViewController3 = segue.destinationViewController as! ViewController3
            
            
            if (segmentedControl.selectedSegmentIndex == 0) {
                
                destViewController3.languageThree = "portuguese"
                
            }
            else if (segmentedControl.selectedSegmentIndex == 1) {
                
                destViewController3.languageThree = "english"
                
            }
        }
        
        
        if (segue.identifier == "ajuda") {
            
            var destViewController5: ViewController5 = segue.destinationViewController as! ViewController5
            
            destViewController5.urlInfo = servertextField.text

            
            if (segmentedControl.selectedSegmentIndex == 0) {
                
                destViewController5.languageFive = "portuguese"
                
            }
                
            else if (segmentedControl.selectedSegmentIndex == 1) {
                
                destViewController5.languageFive = "english"
                
            }

            
        }
        
        
        if (segue.identifier == "principalToConfig") {
            
            var destAdminViewController: AdminViewController = segue.destinationViewController as! AdminViewController
                
            
            if(segmentedControl.selectedSegmentIndex == 0) {
                destAdminViewController.languageAdmin = "portuguese"
                
            }
            
            else if (segmentedControl.selectedSegmentIndex == 1) {
                
                destAdminViewController.languageAdmin = "english"
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



