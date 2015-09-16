//
//  BillDetailViewController.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/15/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit

class BillDetailViewController: UIViewController {
    
    @IBOutlet var billWebView :UIWebView!
    var webviewURL :String!

    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(webviewURL)")
        let url = NSURL (string: webviewURL)
        let requestObj = NSURLRequest(URL: url!);
        billWebView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
