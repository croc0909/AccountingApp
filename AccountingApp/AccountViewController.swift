//
//  AccountViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/2.
//

import UIKit

protocol DismissBackDelegate{
    func dissmissBack(sentData:Any)
}

class AccountViewController: UIViewController {

    
    @IBOutlet weak var accountCollectionView: UICollectionView!
    // data
    let accountDataSource = AccountDataSource()
    
    var newAccountData = accountData(accountName: "", accountAmount: "",backgroundColor: UIColor(red: 100, green: 100, blue: 100, alpha: 1),accountImage: UIImage(named: "purse")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        accountCollectionView.delegate = accountDataSource
        accountCollectionView.dataSource = accountDataSource
        
        configureCellSize()
    }
    
    func configureCellSize() {
        let itemSpace: Double = 2 //間距
        let columnCount: Double = 3 // 每行 cell 的數量
        let flowLayout = accountCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((accountCollectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width + 30)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace // cell 左右間距
        flowLayout?.minimumLineSpacing = itemSpace // cell 上下間距
        
        print("width \(width)")
    }
    
    @IBAction func addAccountAction(_ sender: Any) {
        
        if let addAccountController = storyboard?.instantiateViewController(identifier: "AddAccountViewController") as? AddAccountViewController{
              // 拖曳返回功能
              //controller.isModalInPresentation = true
              // 設定 delegate
              addAccountController.delegate = self
              present(addAccountController, animated: true, completion: nil)
           }
    }
}

extension AccountViewController:DismissBackDelegate{
    func dissmissBack(sentData:Any){
        newAccountData = sentData as! accountData
        print("收到回傳 \(newAccountData)")
        accountDataSource.addAccount(data: newAccountData)
        accountCollectionView.reloadData()
    }
}

