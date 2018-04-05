//
//  NYCSchoolSat.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class NYCSchoolSat: NSObject {
    
    var dbn:String?
    var num_of_sat_test_takers:String?
    var sat_critical_reading_avg_score:String?
    var sat_math_avg_score:String?
    var sat_writing_avg_score: String?
    var school_name: String?
    
    
    init (_ dictionary:Dictionary<String,Any>){
        super.init()
        self.dbn = dictionary["dbn"] as? String
        self.num_of_sat_test_takers = dictionary["num_of_sat_test_takers"] as? String
        self.sat_critical_reading_avg_score = dictionary["sat_critical_reading_avg_score"] as? String
        self.sat_math_avg_score = dictionary["sat_math_avg_score"] as? String
        self.sat_writing_avg_score = dictionary["sat_writing_avg_score"] as? String
        self.school_name = dictionary["school_name"] as? String
    }
    
}

