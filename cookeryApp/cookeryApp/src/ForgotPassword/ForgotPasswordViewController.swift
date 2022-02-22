//
//  ForgotPasswordViewController.swift
//  cookeryApp
//
//  Created by macbook on 22/02/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailTextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextInput.addBottomBorder()
    }
    
    @IBAction func continueBtnClicked(_ sender: Any) {
        guard let emailText = emailTextInput.text else{
            return
        }
        let emailIsValid = CommonUtility.isValidEmail(emailText)
        if(emailIsValid.0){
            print("Valid")
        }else{
            CommonUtility.showAlert(message: emailIsValid.1, parentController: self)
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(vc!, animated: true)
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
