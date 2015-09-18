//
//  ViewController.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/10/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiKey = "bfdd117155524966bd4b59a223d484ae"
    @IBOutlet var searchTextField :UITextField!
    @IBOutlet var searchButton :UIButton!
    @IBOutlet var clearButton :UIButton!

    @IBAction func clearButtonPressed (sender: UIButton) {
        searchTextField.text = ""
    }
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        if searchTextField.text != "" {
        SearchManager.sharedInstance.getDataFromAPIWithSearchQuery(searchTextField.text)
        performSegueWithIdentifier("toSearchResults", sender: self)
        } 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

