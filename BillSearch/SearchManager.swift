//
//  SearchManager.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/12/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit

class SearchManager: NSObject {
   
    static let sharedInstance = SearchManager()
    let apiKey = "bfdd117155524966bd4b59a223d484ae"
    var billArray = [Bill]()
    var searchCount :Int!
    
    

    func getDataFromAPIWithSearchQuery(searchQuery: String) {
        //I'm emptying out the array before filling it. This allows the tableview to reload with 
        //new data. Otherwise the tableview would display the same results as the inital search.
        billArray.removeAll(keepCapacity: true)
        
        var url = NSURL(string: "https://congress.api.sunlightfoundation.com/bills/search?query=\(searchQuery)&congress=114&apikey=\(apiKey)")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            println("error: \(error)")
            
            if error == nil {
                var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
                var err: NSError?
                var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                println("\(jsonResult)")
                let resultsArray = jsonResult.objectForKey("results") as! [NSDictionary]
                let countDict = jsonResult.objectForKey("page") as! NSDictionary
                
                var bill = Bill()
                self.searchCount = countDict.objectForKey("count") as! Int
                
                for results in resultsArray {
                    var bill = Bill()
                    let congressDict = results.objectForKey("urls") as! NSDictionary
                    bill.congressURL = congressDict.objectForKey("congress") as! String
                    bill.billOfficialTitle = results.objectForKey("official_title") as! String
                    bill.billID = results.objectForKey("bill_id") as! String
                    if !(results.objectForKey("popular_title") is NSNull) {
                        bill.billName = results.objectForKey("popular_title") as! String
                    } else {
                        if !(results.objectForKey("short_title") is NSNull) {
                            bill.billName = results.objectForKey("short_title") as! String
                        }
                    }
                    self.billArray.append(bill)
                    let notificationCenter = NSNotificationCenter.defaultCenter().postNotificationName("gotDataNotification", object: nil)
                }
            }
        })
        
    }

    
    
    private override init() {
        super.init()
        println("THC WAS HERE")
    }

}
