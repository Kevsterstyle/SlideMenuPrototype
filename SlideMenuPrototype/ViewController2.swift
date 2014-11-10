//
//  ViewController2.swift
//  SlideMenuPrototype
//
//  Created by Kevin Frei on 30.10.14.
//  Copyright (c) 2014 Team Project. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController {

    @IBOutlet weak var containerView: UIWebView!
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView(frame: self.containerView.frame)
        self.view.addSubview(webView!)
        self.webView?.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //var path = NSBundle.mainBundle().pathForResource("index2", ofType: "htm")
        var url = NSURL(string: "https://dl.dropboxusercontent.com/u/41901902/website/index2.htm")
        var request = NSURLRequest(URL: url!)
        self.webView?.loadRequest(request)
        
        
        self.webView?.scrollView.scrollEnabled = false
        self.webView?.scrollView.bounces = false
        self.webView?.scrollView.clipsToBounds = false // IMPORTANT!!!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
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