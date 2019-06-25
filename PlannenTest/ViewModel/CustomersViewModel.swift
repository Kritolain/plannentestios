//
//  CustomersViewModel.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 23/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialSnackbar

class CustomersViewModel {
    var customersViewController : CustomersViewController?
    var customersArrayModel : [CustomersVOElement] = []
    
    func customersModel(_ customersViewController : CustomersViewController? ) {
        self.customersViewController = customersViewController
        Utils().showLoading()
        AlamofireREST.getCustomersData(completion: {(succes, customerVO, errorServer) in
            if errorServer != nil{
                Utils().showSnackbar(errorServer.debugDescription)
            }else{
                if succes{
                    self.customersArrayModel = customerVO!
                    self.customersViewController?.customersTableVIew.reloadData()
                }else{
                    Utils().showSnackbar("login.errorResponseSignIn")
                }
            }
            Utils().hiddenLoading()
        })
        
    }
    
    //MARK: TABLEVIEW DELEGATE
    
    func createCellCustomers(_ tableView : UITableView, _ indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier : "CustomersTableViewCell" , for : indexPath ) as! CustomersTableViewCell
        cell.loadDataCustomers(self,self.customersArrayModel[indexPath.row], indexPath.row)
        
        
        return cell
    }
    
    func didSelectCell(_ tableView : UITableView, indexPath : IndexPath){
        
    }
    
    /*var  customersViewController : CustomersViewController {
        let storyBoard : UIStoryboard = UIStoryboard( name : "Main" , bundle: Bundle.main )
        let viewController = storyBoard.instantiateViewController( withIdentifier : "CustomersViewController" ) as! CustomersViewController
        return viewController
    }*/
    
    
}
