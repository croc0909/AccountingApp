//
//  AddAccountViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/11/3.
//

import UIKit

protocol pickImageDelegate{
    func pickImageBack(sentData:Any)
}

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
    
    override func viewWillAppear(_ animated: Bool) {
        
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
    
    
    @IBAction func unwindToAddAccount(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
        if let sourceViewController = unwindSegue.source as? AccountImageViewController,
           let thisLovers = sourceViewController.lovers{
            print("get \(thisLovers)")
        }
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

extension AddAccountViewController:pickImageDelegate{
    func pickImageBack(sentData: Any) {
        
    }
}

