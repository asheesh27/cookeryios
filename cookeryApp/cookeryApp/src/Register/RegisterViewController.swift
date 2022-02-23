//
//  RegisterViewController.swift
//  cookeryApp
//
//  Created by macbook on 21/02/22.
//

import UIKit

class RegisterViewController: ViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailIdInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    
//    var activeTextField:UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Register"
        self.firstNameInput.addBottomBorder()
        self.lastNameInput.addBottomBorder()
        self.emailIdInput.addBottomBorder()
        self.genderInput.addBottomBorder()
        self.passwordInput.addBottomBorder()
        self.confirmPasswordInput.addBottomBorder()
        configureTextFields()
        configureTapGesture()
        firstNameInput.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppears(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappears(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    var isExpand : Bool = false
    @objc func keyboardAppears(notification:Notification){
        if !isExpand {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 300)
            isExpand = true
        }
        let info:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.height - keyboardSize.height
        let editingTextFieldY = activeTextField.convert(activeTextField.bounds, to: self.view).minY
        if self.view.frame.minY>=0{
            
            if editingTextFieldY>keyboardY-40{
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - (editingTextFieldY-(keyboardY-100)), width: self.view.bounds.width, height: self.view.bounds.height)
                }, completion: nil)
            }
        }
    }
   
    @objc func keyboardDisappears(notification:Notification){
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func ContinueBtn(_ sender: Any) {
        //safely unwrapping all texts
        guard let fNTextInput = firstNameInput.text else{
            return
        }
        guard let lNTextInput = lastNameInput.text else{
            return
        }
        guard let emailTextInput = emailIdInput.text else{
            return
        }
        guard let genderTextInput = genderInput.text else{
            return
        }
        guard let passwordTextInput = passwordInput.text else{
            return
        }
        guard let confirmPasswordTextInput = confirmPasswordInput.text else{
            return
        }
        //Checking firstname
        if fNTextInput.isEmpty{
            CommonUtility.showAlert(message: "First Name field should not be empty", parentController: self)
        }
        
        //Checking Lastname
        if lNTextInput.isEmpty{
            CommonUtility.showAlert(message: "Last Name field should not be empty", parentController: self)
        }
        
        //checking email ID
        let emailIsValid = CommonUtility.isValidEmail(emailTextInput)
        if(emailIsValid.0){
            print("Valid")
        }else{
            CommonUtility.showAlert(message: emailIsValid.1, parentController: self)
        }
        
        //cheking Gender
        if genderTextInput.isEmpty{
            CommonUtility.showAlert(message: "Gender Field should not be empty", parentController: self)
        }
        
        //checking password
        if passwordTextInput == confirmPasswordTextInput{
            let passwordIsValid = CommonUtility.isValidPassword(passwordTextInput)
            if (passwordIsValid.0){
                print("valid")
            }else{
                CommonUtility.showAlert(message: passwordIsValid.1, parentController: self)
            }
            
        }else{
            CommonUtility.showAlert(message: "Passwords mismatched", parentController: self)
        }
    }
    
    private func configureTextFields(){
        firstNameInput.delegate = self
        lastNameInput.delegate = self
        emailIdInput.delegate = self
        genderInput.delegate = self
        passwordInput.delegate = self
        confirmPasswordInput.delegate = self
    }

    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
}
