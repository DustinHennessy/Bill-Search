//
//  DetailViewController.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/10/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, congressLinkDelegate {

    @IBOutlet var searchResultsTableView :UITableView!
    var searchResultsArray = [Bill]()
    @IBOutlet var countLabel :UILabel!
    var searchQueryText :String!
    let billManager = SearchManager.sharedInstance
    let apiKey = "bfdd117155524966bd4b59a223d484ae"
    var billURL :String!

    func linkClicked(url: String) {
        println("delegate func")
        billURL = url
        performSegueWithIdentifier("toWebView", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return billManager.billArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :BillDetailTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! BillDetailTableViewCell
        let currentBill = billManager.billArray[indexPath.row]
        cell.billTitleLabel.text = currentBill.billName
        cell.billIDLable.text = currentBill.billID
        cell.officialTitleLabel.text = currentBill.billOfficialTitle
        cell.billURL = currentBill.congressURL
        cell.linkDelgate = self
        
        return cell
        
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let currentBill = billManager.billArray[indexPath.row]
//        billURL = currentBill.congressURL
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destController = segue.destinationViewController as! BillDetailViewController
        destController.webviewURL = billURL
    }
    
    func searchDoneNotification() {
        billManager.billArray.sort { $1.billDate < $0.billDate }
        let countStringValue = "\(SearchManager.sharedInstance.searchCount)"
        countLabel.text = countStringValue
        searchResultsTableView.reloadData()
        println("Search done!")
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
   
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter().addObserver(self, selector: "searchDoneNotification", name: "gotDataNotification", object: nil)
        searchResultsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
