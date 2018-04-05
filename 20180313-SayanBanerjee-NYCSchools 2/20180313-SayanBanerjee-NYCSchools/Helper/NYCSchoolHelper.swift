//
//  NYCSchoolHelper.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

struct Constant {
    static let BASE_URL: String = "https://data.cityofnewyork.us/resource/"///97mf-9njv.json"
    //https://data.cityofnewyork.us/resource/f9bf-2cp4.json
    //https://data.cityofnewyork.us/resource/734v-jeq5.json // Sat score URL
}

struct NYCSchoolHelper {

    static func baseURL() -> String {
        return "\(Constant.BASE_URL)"
    }
    
    static func schoolListUrl() -> String {
        return "97mf-9njv.json"
    }
    
    static func satScoreListUrl() -> String {
        return "734v-jeq5.json"
    }
}
