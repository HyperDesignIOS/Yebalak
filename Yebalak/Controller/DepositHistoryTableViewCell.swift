//
//  DepositHistoryTableViewCell.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class DepositHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!  
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
