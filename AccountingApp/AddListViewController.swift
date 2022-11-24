//
//  AddListViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/9.
//

import UIKit



class AddListViewController: UIViewController {

    @IBOutlet weak var addListTableView: UITableView!
    @IBOutlet weak var accountTypeSegmentedControl: UISegmentedControl!
    
    var names = ["拍照", "從相簿"]
    var accounts = existingAccounts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print("AddListViewController \(accounts)")
    }
    
    func setTableView(){
        addListTableView.delegate = self
        addListTableView.dataSource = self
    }
    
    func alertAction(title:String){
        switch title{
        case "\(names[0])":
            //print("\(title)")
            takePhotobyCamera()
        case "\(names[1])":
            //print("\(title)")
            takePhotobyAlbum()
        default:
            print("Null")
        }
    }
    
    @IBAction func takePhotoAction(_ sender: Any) {
        let controller = UIAlertController(title: "選擇照片方式", message: "", preferredStyle: .actionSheet)
        for name in names {
           let action = UIAlertAction(title: name, style: .default) { action in
               self.alertAction(title: name)
           }
           controller.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
    }
    
    func takePhotobyCamera(){
        print("拍照")
    }
    
    func takePhotobyAlbum(){
        print("從相簿")
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

extension AddListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCostCell", for: indexPath)
            return cell
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CostCategoryCell", for: indexPath)
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            return cell
        }else if(indexPath.row == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeductionCell", for: indexPath)
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CostCategoryCell", for: indexPath)
            return cell
        }
    }
}
