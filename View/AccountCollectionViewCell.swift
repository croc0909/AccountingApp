//
//  AccountCollectionViewCell.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/2.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "\(AccountCollectionViewCell.self)"
    
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    
}
