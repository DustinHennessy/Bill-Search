//
//  BillDetailTableViewCell.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/11/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit
protocol congressLinkDelegate{
    func linkClicked(url: String)
}

class BillDetailTableViewCell: UITableViewCell {

    @IBOutlet var billTitleLabel :UILabel!
    @IBOutlet var billIDLable :UILabel!
//    @IBOutlet var congressURLLabel :UILabel!
    @IBOutlet var officialTitleLabel :UILabel!
    @IBOutlet var urlButton :UIButton!
    var billURL :String!
    var linkDelgate :congressLinkDelegate?
    
    

    
    @IBAction func urlButtonPressed(sender: UIButton) {
        println("\(billURL)")
        linkDelgate?.linkClicked(billURL)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
