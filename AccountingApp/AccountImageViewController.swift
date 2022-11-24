//
//  AccountImageViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/17.
//

import UIKit

protocol cellReturnPickImageDelegate{
    func cellReturnPickImageDelegate(sentData:Any)
}

class AccountImageViewController: UIViewController {
    
    @IBOutlet weak var accountImageCollectionView: UICollectionView!
    // 回傳上一頁資料
    var lovers: String?
    
    // data
    let accountImageDataSource = AccountImageDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setDelegate()
        // Do any additional setup after loading the view.
    }
    
    func setDelegate(){
        accountImageDataSource.delegate = self
    }

    func setCollectionView(){
        accountImageCollectionView.delegate = accountImageDataSource
        accountImageCollectionView.dataSource = accountImageDataSource
        configureCellSize()
    }
    
    func configureCellSize() {
        let itemSpace: Double = 2 //間距
        let columnCount: Double = 3 // 每行 cell 的數量
        let flowLayout = accountImageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((accountImageCollectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width + 30)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace // cell 左右間距
        flowLayout?.minimumLineSpacing = itemSpace // cell 上下間距
        
        print("width \(width)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        lovers = "Hi"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AccountImageViewController:cellReturnPickImageDelegate{
    func cellReturnPickImageDelegate(sentData: Any) {
        print("收到圖 \(sentData)")

        dismiss(animated: true, completion: nil)
    }
}
