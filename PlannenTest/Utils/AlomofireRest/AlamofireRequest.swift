//
//  AlamofireRequest.swift
//  PlannenTest
//
//  Created by Carolain Lenes Beltran on 21/06/19.
//  Copyright © 2019 Simpleapp SAS. All rights reserved.
//

import Foundation
import Alamofire

open class AlamofireREST{
    
    //Funtions
    static func parametersRequest(_ methodFunction : String, _ parameters : [String: Any]?, _ requestType : String) -> URLRequest{
        
        let url = Globals().urlApi + methodFunction
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = requestType
        if parameters != nil{
            do {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters!)
                
                urlRequest.httpBody = jsonData
            }
        }
        
        return urlRequest
    }
    
    // getUserData Request
    static func getUserData(_ email: String,_ pass: String,completion: @escaping (Bool,UserVO?, NSError?) -> Void){
        let urlParameteres = "login.php?email=" + email + "&pass=" + pass
        let urlRequest = self.parametersRequest(urlParameteres, nil, HTTPMethod.get.rawValue)
        Alamofire.request(urlRequest).responseJSON{
            response in
            let statusCode = response.response?.statusCode
            print("Status Code", statusCode ?? Int())
            switch response.result{
                
            case .success(_):
                
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200:
                        //let datastring = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                        guard let user = try? JSONDecoder().decode(UserVO.self, from: response.data!) else{
                            completion(false, nil,nil)
                            return
                        }
                        completion(true, user,nil)
                        break
                    case 400:
                        completion(false, nil, response.error! as NSError)
                        break
                    case 500:
                        completion(false, nil,response.error! as NSError)
                        break
                    default: break
                        
                    }
                } else {
                    completion(false, nil,response.error! as NSError)
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error as NSError)
            }
            
        }
    }
    
    
    // getCustomers Request
    static func getCustomersData(completion: @escaping (Bool,CustomersVO?, NSError?) -> Void){
        let userId = Utils().getUserDefault("userId")
        let urlParameteres = "customers.php?userId=" + userId!
        let urlRequest = self.parametersRequest(urlParameteres, nil, HTTPMethod.get.rawValue)
        Alamofire.request(urlRequest).responseJSON{
            response in
            let statusCode = response.response?.statusCode
            print("Status Code", statusCode ?? Int())
            switch response.result{
                
            case .success(_):
                
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200:
                        guard let customersVO = try? JSONDecoder().decode(CustomersVO.self, from: response.data!) else{
                            completion(false, nil,nil)
                            return
                        }
                        completion(true, customersVO,nil)
                        break
                    case 400:
                        completion(false, nil, response.error! as NSError)
                        break
                    case 500:
                        completion(false, nil,response.error! as NSError)
                        break
                    default: break
                        
                    }
                } else {
                    completion(false, nil,response.error! as NSError)
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error as NSError)
            }
            
        }
    }
    
    
    
}
