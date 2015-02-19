//
//  ViewController4.swift
//  SlideMenuPrototype
//
//  Created by Kevin Frei on 17.02.15.
//  Copyright (c) 2015 Team Project. All rights reserved.
//

import UIKit
import WebKit

class ViewController4: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var containerView: UIWebView!
    var webView : WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView(frame: containerView.frame)
        self.view.addSubview(webView!)
        self.webView?.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: "https://dl.dropboxusercontent.com/u/41901902/website/page_4_001.html")
        var request = NSURLRequest(URL: url!)
        self.webView?.loadRequest(request)
        self.webView?.navigationDelegate = self
        
        self.webView?.scrollView.scrollEnabled = false
        self.webView?.scrollView.bounces = false
        self.webView?.scrollView.clipsToBounds = false
       
    }

    //Start the network activity indicatior in the status bar when the web view is loading
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    //Stop the network activity indicatior in the status bar when the web view finished loading
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    //In case of an error stop the animation
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
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
