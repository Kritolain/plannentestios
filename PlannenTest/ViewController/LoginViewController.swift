//
//  LoginViewController.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginModel : LoginViewModel = LoginViewModel()
 
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
    }
    
    func configurerView(){
        let signIn = Utils().getUserDefault("loginSucces")
        if signIn == "true"{
            goToNextScreen(loginModel.customersViewController,false)
        }
    }
    
    func goToNextScreen(_ customersViewController : CustomersViewController, _ animated : Bool){
        self.navigationController?.pushViewController(customersViewController, animated: animated)
    }
    
    // Actions
    // login Button
    @IBAction func loginValidateButton(_ sender: UIButton) {
      loginModel.loginUser(self)
    }

}
