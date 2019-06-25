//
//  CustomersViewController.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import UIKit

class CustomersViewController: UIViewController {

    @IBOutlet weak var customersTableVIew: UITableView!
    @IBOutlet var headerHeightLayout : NSLayoutConstraint!
    
    
    var customersViewModel : CustomersViewModel = CustomersViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
    }
    
    func configurerView(){
        if Int(Utils().screenHeight) >= screenHeightEnum.iPhoneXs.rawValue{
            self.headerHeightLayout.constant = 80
        }
        self.customersViewModel.customersModel(self)
    }
    
    //Actions
    @IBAction func selectMenuItems(_ sender: UIButton) { // Create An UIAlertController with Action Sheet
        
        let optionMenuController = UIAlertController(title: nil, message: "Escoge tu opción", preferredStyle: .actionSheet)
        
        // Create UIAlertAction for UIAlertController
        
        let addAction = UIAlertAction(title: "Cerrar sesión", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            Utils().saveUserDefault("", "userId")
            Utils().saveUserDefault("", "email")
            Utils().saveUserDefault("false", "loginSucces")
            self.navigationController?.popViewController(animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        // Add UIAlertAction in UIAlertController
        
        optionMenuController.addAction(addAction)
        optionMenuController.addAction(cancelAction)
        
        // Present UIAlertController with Action Sheet
        
        self.present(optionMenuController, animated: true, completion: nil)
        
    }
    
}

extension CustomersViewController: UITableViewDelegate,UITableViewDataSource{
    
    //MARK: TABLEVIEW DELEGATE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customersViewModel.customersArrayModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return customersViewModel.createCellCustomers(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        customersViewModel.didSelectCell(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}
