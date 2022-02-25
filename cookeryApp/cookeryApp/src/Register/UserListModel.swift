//
//  LoginRequestModel.swift
//  cookeryApp
//
//  Created by macbook on 22/02/22.
//

import UIKit

struct LoginRequestModel {
    var firstName: String
    var lastName: String
    var gender:String
    var emailId: String
    var password: String
    
    init() {
        firstName = ""
        lastName = ""
        gender = ""
        emailId = ""
        password = ""
    }

}
