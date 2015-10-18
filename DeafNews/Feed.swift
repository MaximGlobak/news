//
//  Feed.swift
//  DeafNews
//
//  Created by Александр on 06.10.15.
//  Copyright © 2015 Александр. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol feedDelegate {
    func updateFeedInfo(titles: [String])
}

class Feed: NSObject {
    
    var delegate: feedDelegate!
    
    var title: String = ""
    var author: String = ""
    var shortText: String = ""
    var content: String = ""
    var link: String = ""
    var main_img: String = ""
    var date: String = ""
    
    //var titles = [String]()

    func parse(urlString: String){
        var titles = [String]()
        //Отправляем GET запрос и получаем JSON
        let url = NSURL(string: urlString)
            
        NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            let json = JSON(data: data!)
            for article in json.arrayValue{
                titles.append(article["title"].stringValue)
                print(article["title"].stringValue)
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.updateFeedInfo(titles)
            })
        }.resume()
    }

}


