//
//  DailyCollectionViewCell.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/10/27.
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "\(DailyCollectionViewCell.self)"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateButton: UIButton!
    
}
