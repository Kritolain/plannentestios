//
//  LoginViewModel.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialSnackbar

class LoginViewModel {
    var loginViewController : LoginViewController?
    
    func loginUser(_ loginViewController : LoginViewController? ) {
        self.loginViewController = loginViewController
        let email = loginViewController?.emailTextField.text
        let password = loginViewController?.passwordTextField.text
        
        if (!email!.isEmpty && !password!.isEmpty) {
            if(email!.isValidEmail){
                Utils().showLoading()
                AlamofireREST.getUserData(email!,password!,completion: {(succesUserData, userVO, errorServer) in
                    if errorServer != nil{
                        Utils().showSnackbar(errorServer.debugDescription)
                    }else{
                        if succesUserData{
                            
                            let userId = userVO?.userID
                            Utils().saveUserDefault(userId, "userId")
                            Utils().saveUserDefault(email, "email")
                            Utils().saveUserDefault("true", "loginSucces")
                            self.loginViewController?.navigationController?.pushViewController(self.customersViewController, animated: true)
                       
                            
                        }else{
                            Utils().showSnackbar("login.errorResponseSignIn")
                        }
                    }
                    Utils().hiddenLoading()
                })
            
            }else{
              Utils().showSnackbar("login.emailValidator")
            }
        }else{
            Utils().showSnackbar("login.emptyField")
        }
    }
    
    var  customersViewController : CustomersViewController {
        let storyBoard : UIStoryboard = UIStoryboard( name : "Main" , bundle: Bundle.main )
        let viewController = storyBoard.instantiateViewController( withIdentifier : "CustomersViewController" ) as! CustomersViewController
        return viewController
    }
}
