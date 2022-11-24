//
//  AccountImageDataSourse.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/17.
//

import Foundation
import UIKit

class AccountImageDataSource:NSObject,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var delegate:cellReturnPickImageDelegate?
    
    var accountImages = imageList // 帳號縮圖陣列
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        accountImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:AccountImageCollectionViewCell.reuseIdentifier , for: indexPath) as! AccountImageCollectionViewCell
        cell.accountImageView.image = UIImage(named: "\(accountImages[indexPath.row])")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("select \(accountImages[indexPath.row])")
        delegate?.cellReturnPickImageDelegate(sentData: accountImages[indexPath.row])
    }
}


