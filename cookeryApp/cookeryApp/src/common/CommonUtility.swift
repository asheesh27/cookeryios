//
//  CommonUtility.swift
//  cookeryApp
//
//  Created by macbook on 21/02/22.
//

import UIKit

class CommonUtility: NSObject {
    
   class func showAlert(title: String = "Error!", message: String, parentController: UIViewController ) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { UIAlertAction in
            print("Yeah")    }
        alert.addAction(action)
        parentController.present(alert, animated: true, completion: nil)
    }
    
   class func isValidEmail(_ emailId: String) -> (Bool,String) {
        if(emailId.isEmpty) {
            return (false, "Email field should not be empty.")
        } else if !isValidEmailId(email : emailId){
            return (false, "Email Id Invalid")
        }
       return (true,"emailId okay")
    }
    
    class func isValidPassword(_ password:String) -> (Bool,String) {
        if(password.isEmpty) {
            return (false,"Password field should not be empty.")
        } else if !isValidPassword(password: password){
            return (false,"Password invalid. \n Password Must contain : \n One Upper case letter \n One special character \n One number and \n atleast 8 characters")
        }
        return (true,"password Okay")
    }
    
    class func isValidEmailId(email:String)->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func isValidPassword(password:String)->Bool{
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
