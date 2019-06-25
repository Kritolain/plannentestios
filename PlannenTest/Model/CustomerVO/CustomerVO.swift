//
//  CustomerVO.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation

// MARK: - CustomersVOElement
struct CustomersVOElement: Codable {
    let customerID, nombre, apellido, direccion: String
    let telefono, estado, userID: String
    
    enum CodingKeys: String, CodingKey {
        case customerID = "customerId"
        case nombre, apellido, direccion, telefono, estado
        case userID = "userId"
    }
}

typealias CustomersVO = [CustomersVOElement]
