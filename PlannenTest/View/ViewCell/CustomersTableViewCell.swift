//
//  CustomersTableViewCell.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 23/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import UIKit
import AlamofireImage

class CustomersTableViewCell: UITableViewCell {
    
    //Variables
    var customersViewModel : CustomersViewModel = CustomersViewModel()
    var indexRow : Int = 0
    
    //Outlets
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadDataCustomers(_ customersViewModel : CustomersViewModel, _ customersVO : CustomersVOElement, _ index : Int){
        self.indexRow = index
        //var vo = customersVO.index(after: indexRow)
        self.nameLabel.text = customersVO.nombre
        self.lastnameLabel.text = customersVO.apellido
        self.addressLabel.text = customersVO.direccion
        self.phoneLabel.text = customersVO.telefono
        
        let state = customersVO.estado
      
        switch state {
        case "0":
            self.stateView.backgroundColor = UIColor(rgb: 0xF00808)
            break
        case "1":
            self.stateView.backgroundColor = UIColor(rgb: 0x673AB7)
            break
        case "2":
            self.stateView.backgroundColor = UIColor(rgb: 0x53B534)
            break
        case "3":
            self.stateView.backgroundColor = UIColor(rgb: 0x00808)
            break
        case "4":
            self.stateView.backgroundColor = UIColor(rgb: 0xFFEB3B)
            break
        default:
            break
        }
    }
}
