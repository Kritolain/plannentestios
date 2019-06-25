//
//  UserVO.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation

struct UserVO: Codable {
    let succes: Bool
    let resultMessage, userID: String
    
    enum CodingKeys: String, CodingKey {
        case succes, resultMessage
        case userID = "userId"
    }
}
