//
//  AddCostCell.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/23.
//

import UIKit

class AddCostCell: UITableViewCell {

    static let reuseIdentifier = "\(AddCostCell.self)"
    
    @IBOutlet weak var titleTypeLabel: UILabel!
    @IBOutlet weak var costTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
