//
//  MainTableViewController.swift
//  DeafNews
//
//  Created by Александр on 29.09.15.
//  Copyright © 2015 Александр. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, feedDelegate {
    
    var feedParser = Feed()
    var feeds = [String]()
    
    func updateFeedInfo(titles: [String]){
        feeds = titles
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedParser.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        feedParser.parse("http://localhost:8888/test.json")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return feeds.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = feeds[indexPath.row]
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Ok")
        self.tableView.reloadData()
        
//        let feed = feeds[indexPath.row]
//
//        let newsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NewsViewController") as! NewsViewController
//        
//        newsViewController.feed = feed
//        
//        self.navigationController!.pushViewController(newsViewController, animated: true)
        

    }

}
