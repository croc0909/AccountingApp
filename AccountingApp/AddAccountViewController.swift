//
//  AddAccountViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/3.
//

import UIKit

class AddAccountViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var bufgetTextField: UITextField!
    @IBOutlet weak var accountColorWell: UIColorWell!
    @IBOutlet weak var accountImageView: UIImageView!
    
    
    var dataToBeSent = accountData(accountName: "", accountAmount: "", backgroundColor: UIColor(red: 100, green: 100, blue: 100, alpha: 1),accountImage: UIImage(named: "purse")!)
    var delegate:DismissBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        dismissView()
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        guard let accountText = accountTextField.text else { return }
        
        guard let bufgetText = bufgetTextField.text else { return }

        dataToBeSent.accountName = accountText
        dataToBeSent.accountAmount = bufgetText
        dataToBeSent.backgroundColor = accountColorWell.selectedColor!
        delegate?.dissmissBack(sentData: dataToBeSent)
        print("color \(String(describing: accountColorWell.selectedColor!))")
        dismissView()
    }
    
    @IBAction func accountImageAction(_ sender: Any) {
        performSegue(withIdentifier: "pickAccountImage", sender: nil)
    }
    
    
    func dismissView(){
        dismiss(animated: true, completion: nil)
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
