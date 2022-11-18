//
//  AccountDataSourse.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/2.
//

import Foundation
import UIKit

class AccountDataSource:NSObject,UICollectionViewDelegate,UICollectionViewDataSource{
    
    //帳號陣列
    var accounts = existingAccounts
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AccountCollectionViewCell.reuseIdentifier , for: indexPath) as! AccountCollectionViewCell
        cell.titleLabel.text = accounts[indexPath.row].accountName
        cell.amountLabel.text = accounts[indexPath.row].accountAmount
        cell.typeImage.image = accounts[indexPath.row].accountImage
        cell.backGroundImage.backgroundColor = accounts[indexPath.row].backgroundColor
        return cell
    }
    
    func addAccount(data:accountData){
        accounts.append(accountData(accountName: data.accountName, accountAmount: data.accountAmount, backgroundColor: data.backgroundColor,accountImage: UIImage(named: "purse")!))
    }
}
