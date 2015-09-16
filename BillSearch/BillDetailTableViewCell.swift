//
//  BillDetailTableViewCell.swift
//  BillSearch
//
//  Created by Dustin Hennessy on 9/11/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit

class BillDetailTableViewCell: UITableViewCell {

    @IBOutlet var billTitleLabel :UILabel!
    @IBOutlet var billIDLable :UILabel!
    @IBOutlet var congressURLLabel :UILabel!
    @IBOutlet var officialTitleLabel :UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
