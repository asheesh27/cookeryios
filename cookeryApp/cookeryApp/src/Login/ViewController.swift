//
//  ViewController.swift
//  cookeryApp
//
//  Created by macbook on 21/02/22.
//

import UIKit

enum tfStyleType: Int {
    case none = 0
    case bottomBorder
    case rounded
    case plane
}

class ViewController: UIViewController {
    var requestModel : LoginRequestModel = LoginRequestModel.init(emailId: <#T##String#>, password: <#T##String#>)
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    var emailTextInput:String = ""
    var passwordTextInput:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailId?.addBottomBorder()
        self.passwordField?.addBottomBorder()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let emailTextInput = emailId.text else{
            return
        }
        requestModel.emailId = emailTextInput
        guard let passwordTextInput = passwordField?.text else{
            return
        }
        let emailIsValid = CommonUtility.isValidEmail(emailTextInput)
        let passwordIsValid = CommonUtility.isValidPassword(passwordTextInput)
        if(emailIsValid.0){
            print("Valid")
        }else{
            CommonUtility.showAlert(message: emailIsValid.1, parentController: self)
        }
        if (passwordIsValid.0){
            print("valid")
        }else{
            CommonUtility.showAlert(message: passwordIsValid.1, parentController: self)
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as? ForgotPasswordViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}



