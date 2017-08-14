//
//  ExpensesTableViewCell.swift
//  Budget Up
//
//  Created by Lena Ngungu on 8/12/17.
//  Copyright © 2017 Lena Ngungu. All rights reserved.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var requiredAmountTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
