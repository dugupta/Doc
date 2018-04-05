//
//  NYCSchoolApi.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

struct NYCSchoolApi {
    
    static func fetchSchoolListfor(_ url: String, completion:@escaping Completion) {
        NetworkManager.shared.getData(url) { (response, error) in
            completion(response, error)
        }
    }
    
    static func fetchSchoolScorefor(_ url: String, completion:@escaping Completion) {
        NetworkManager.shared.getData(url) { (response, error) in
            completion(response, error)
        }
    }
}
