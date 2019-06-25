//
//  Utils.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation
import KVNProgress
import MaterialComponents.MaterialSnackbar

enum screenHeightEnum: Int {
    case iPhone = 568
    case iPhoneSix = 667
    case iPhonePlus = 736
    case iPhoneXs = 812
    case iPhoneXr = 896
}

class Utils {
    
    //-------------- Show Load Indicator --------------!!
    func showLoading() {
        KVNProgress.show()
    }
    func hiddenLoading(){
        KVNProgress.dismiss()
    }
    
    //-------------- Alert Snackbar --------------!!
    func showSnackbar (_ fieldName: String){
        let message = MDCSnackbarMessage()
        message.text = NSLocalizedString(fieldName, comment: "validate fields login")
        MDCSnackbarManager.show(message)
    }
    
    //-------------- User Defaults --------------!!
    
    func saveUserDefault(_ stringValue : String?, _ objectName : String){
        let userDefault = UserDefaults.standard
        if stringValue != nil {
            userDefault.set(stringValue, forKey: objectName)
        }
    }
    
    func getUserDefault(_ objectName : String) -> (String?){
        let userDefault = UserDefaults.standard
        return (userDefault.object(forKey: objectName) as? String)
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
}


extension String{
    
    //-------------- SignIn --------------!!
    // Email Validation
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
