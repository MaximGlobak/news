//
//  SideBarTableViewController.swift
//  DeafNews
//
//  Created by Александр on 01.10.15.
//  Copyright © 2015 Александр. All rights reserved.
//

import UIKit
import MMDrawerController

class SideBarTableViewController: UITableViewController {
    
    let menu = [
        "RU",
        "Asia"
    ]
    let mainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainTableViewController") as! MainTableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SidebarCell", forIndexPath: indexPath)

        cell.textLabel!.text = menu[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        switch(indexPath.row)
        {
            
        case 0:
            mainController.feedParser.parse("http://localhost:8888/Ru_press.json")
            break
            
        case 1:
            mainController.feedParser.parse("http://localhost:8888/Asia_press.json")
            break
            
        default:
            print("\(menu[indexPath.row]) is selected")
        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        
    }
}