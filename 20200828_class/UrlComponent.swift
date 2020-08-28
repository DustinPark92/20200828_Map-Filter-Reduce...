//
//  UrlComponent.swift
//  20200828_class
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

struct UrlComponent {
    
    static let boxOffice = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIkey.boxKey)&targetDt=20120101"

    
}


struct APIkey {
   static  let boxKey = "0af24c045d8581cabf09c5ebb768fb91"
}
