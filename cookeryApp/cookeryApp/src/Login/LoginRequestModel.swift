//
//  LoginRequestModel.swift
//  cookeryApp
//
//  Created by macbook on 22/02/22.
//

import UIKit

typealias ValidationResult = (Bool, String)

struct LoginRequestModel {
    var emailId: String
    var password: String
    
    func isValid() -> ValidationResult {
       return CommonUtility.isValidEmail(emailId)
    }
}
