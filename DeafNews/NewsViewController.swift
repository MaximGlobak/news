//
//  NewsViewController.swift
//  DeafNews
//
//  Created by Александр on 06.10.15.
//  Copyright © 2015 Александр. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var feed = Feed()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wvBody: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = feed.title
        
        wvBody.loadHTMLString(feed.content, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
