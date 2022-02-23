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
//    var requestModel : LoginRequestModel = LoginRequestModel.init(emailId: String, password: String)
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    var emailTextInput:String = ""
    var passwordTextInput:String = ""
    var activeTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailId?.addBottomBorder()
        self.passwordField?.addBottomBorder()
        emailId?.becomeFirstResponder()
        configureTextFields()
        configureTapGesture()
        
    }
    
    private func configureTextFields(){
        emailId?.delegate = self
        passwordField?.delegate = self
    }
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        print("Handle tap was called")
        view.endEditing(true)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let emailTextInput = emailId.text else{
            return
        }
//        requestModel.emailId = emailTextInput
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

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = self.view.viewWithTag(nextTag) as? UITextField {
               nextResponder.becomeFirstResponder()
           } else {
                   textField.resignFirstResponder()
           }

           return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
      
        print("Textfield ended editing ")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Ended editing")
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("changing characters")
        return true
    }
}

