//
//  NetworkManager.swift
//  20200828_class
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    //싱글톤
    static let shared = NetworkManager()
    
    func getBoxOffice(url : String,success : @escaping (JSON) -> (), fail: @escaping() -> () ){
        
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
        
                
            case .failure(let error):
                break
                
            }
        }
        
        
        
    }
    
    
}




// 얼럿 띄울때
