//
//  RegisterViewController.swift
//  cookeryApp
//
//  Created by macbook on 21/02/22.
//

import UIKit

class RegisterViewController: ViewController {

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailIdInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    
    
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
