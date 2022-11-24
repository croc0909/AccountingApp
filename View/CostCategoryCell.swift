//
//  CostCategoryCell.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/24.
//

import UIKit

class CostCategoryCell: UITableViewCell {

    @IBOutlet weak var titleTypeLabel: UILabel!
    @IBOutlet weak var currentTitleTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
