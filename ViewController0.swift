//
//  ViewController0.swift
//  Ramal Nacional
//
//  Created by Daniel F Yarochewsky on 5/22/15.
//  Copyright (c) 2015 D'FY. All rights reserved.
//

import UIKit

class ViewController0: UIViewController,UIPageViewControllerDataSource {

    
    var pageViewController = UIPageViewController()
    
    var pageTitles: NSArray!
    
    var pageImages = NSArray()
    
    var languageZero = String()
    
    
   
    @IBAction func restartB(sender: AnyObject) {
    
        
        
        var startVC = self.viewCoontrollerAtIndex(0) as ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        
        
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
            
        
        self.pageTitles = NSArray(objects: "0", "1","2","3")
        self.pageImages = NSArray(objects: "welcome","eng_01","eng_02","eng_03")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var startVC = self.viewCoontrollerAtIndex(0) as ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height-60)
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func viewCoontrollerAtIndex(index: Int) -> ContentViewController {
        
        if ((self.pageTitles.count == 0 ) || (index >= self.pageTitles.count)) {
            return ContentViewController()
        }
        
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        vc.imageFile = self.pageImages[index]as! String
        vc.title = self.pageTitles[index] as? String
        vc.pageIndex = index
        
        return vc
    }
    
    
    //MARK: -Page View Controller Data Source
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        if ( index == 0 || index == NSNotFound)  {
            
            return nil
        
        }
        
        index--
        return self.viewCoontrollerAtIndex(index)
        
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewCoontrollerAtIndex(index)
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "tutorialEnglishToPrincipal") {
            
            
            var destViewController: ViewController = segue.destinationViewController as! ViewController
            

           destViewController.language = "english"
        }
    
    

}

}
