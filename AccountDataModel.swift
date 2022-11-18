//
//  AccountDataModel.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/3.
//

import Foundation
import UIKit

struct accountData{
    var accountName:String
    var accountAmount:String
    var backgroundColor:UIColor
    var accountImage:UIImage
}

var imageList = ["bed","toys","puzzle","ux","book","book1","money","money1","stationery","stationery1"]

var existingAccounts = [accountData(accountName: "收入帳戶", accountAmount: "0", backgroundColor: UIColor(red: 200/255, green: 100/255, blue: 100/255, alpha: 1),accountImage: UIImage(named: "purse")!),accountData(accountName: "支出帳戶", accountAmount: "0", backgroundColor: UIColor(red: 100/255, green: 200/255, blue: 150/255, alpha: 1),accountImage: UIImage(named: "purse")!)]
