//
//  Extension.swift
//  20200828_class
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

extension UIViewController {
    
        func showAlertOK(mainTitle : String , mainMessage : String , alertMessage: String ,success : @escaping (String) -> ()) {

            let alert = UIAlertController(title: mainTitle, message: mainMessage, preferredStyle: .alert)
            

            let ok = UIAlertAction(title: alertMessage, style: .default) { completion in
                let nickname = "고래밥"
                success(nickname)
            }
            let cancel =  UIAlertAction(title: "취소", style: .cancel, handler: nil )
    
            alert.addAction(ok)
            alert.addAction(cancel)
            
            present(alert, animated: true , completion: nil)
        }
}
