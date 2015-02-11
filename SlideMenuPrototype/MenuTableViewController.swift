//
//  MenuTableViewController.swift
//  SlideMenuPrototype
//
//  Created by Kevin Frei on 29.10.14.
//  Copyright (c) 2014 Team Project. All rights reserved.
//
//
//  Used ENSwiftSideMenu: https://github.com/evnaz/ENSwiftSideMenu Created by Evgeny on 24.07.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var selectedMenuItem: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //Customize appearance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        //Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRowAtIndexPath((NSIndexPath(forRow: selectedMenuItem, inSection: 0)), animated: false, scrollPosition: .Middle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
              var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel!.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel?.text = "Chart \(indexPath.row+1)"

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == selectedMenuItem) {
            return
        }
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var destViewController: UIViewController
        
        switch(indexPath.row) {
        case 0: destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Chart1") as UIViewController
            break
        case 1: destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Chart2") as UIViewController
            break
        default: destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Chart3") as UIViewController
            break
            
        }
        sideMenuController()?.setContentViewController(destViewController)
        
    }

   
}
