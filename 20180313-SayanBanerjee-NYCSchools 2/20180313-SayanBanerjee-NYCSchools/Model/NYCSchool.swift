//
//  NYCSchool.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class NYCSchool: NSObject {

    var academicopportunities1:String?
    var academicopportunities2:String?
    var admissionspriority11:String?
    var admissionspriority21:String?
    var admissionspriority31:String?
    var attendance_rate:String?
    var bbl:Double?
    var bin:Double?
    var boro:String?
    var borough:String?
    var building_code:String?
    var bus:String?
    var census_tract:Double?
    var city:String?
    var code1:String?
    var community_board:Double?
    var council_district:Double?
    var dbn:String?
    var directions1:String?
    var ell_programs:String?
    var extracurricular_activities:String?
    var fax_number:String?
    var finalgrades:String?
    var grade9geapplicants1:String?
    var grade9geapplicantsperseat1:String?
    var grade9gefilledflag1:String?
    var grade9swdapplicants1:String?
    var grade9swdapplicantsperseat1:String?
    var grade9swdfilledflag1:String?
    var grades2018:String?
    var interest1:String?
    var language_classes:String?
    var latitude:String?
    var location:String?
    var longitude:String?
    var method1:String?
    var neighborhood:String?
    var nta:String?
    var overview_paragraph:String?
    var pct_stu_enough_variety:String?
    var pct_stu_safe:String?
    var phone_number:String?
    var primary_address_line_1:String?
    var program1:String?
    var school_10th_seats:Double?
    var school_email:String?
    var school_name:String?
    var school_sports:String?
    var seats101:String?
    var seats9ge1:String?
    var seats9swd1:String?
    var state_code:String?
    var subway:String?
    var total_students:Double?
    var transfer:Double?
    var website:String?
    var zip:Double?
    
    
    
    init (_ dictionary:Dictionary<String,Any>){
        super.init()
        
        self.academicopportunities1=dictionary["academicopportunities1"] as? String
        self.academicopportunities2=dictionary["academicopportunities2"] as? String
        self.admissionspriority11=dictionary["admissionspriority11"] as? String
        self.admissionspriority21=dictionary["admissionspriority21"] as? String
        self.admissionspriority31=dictionary["admissionspriority31"] as? String
        self.attendance_rate=dictionary["bbl"] as? String
        self.bbl=dictionary["bbl"] as? Double
        self.bin=dictionary["bin"] as? Double
        self.boro=dictionary["boro"] as? String
        self.borough=dictionary["borough"] as? String
        self.building_code=dictionary["building_code"] as? String
        self.bus=dictionary["bus"] as? String
        self.census_tract=dictionary["census_tract"] as? Double
        self.city=dictionary["city"] as? String
        self.code1=dictionary["code1"] as? String
        self.community_board=dictionary["community_board"] as? Double
        self.council_district=dictionary["council_district"] as? Double
        self.dbn=dictionary["dbn"] as? String
        self.directions1=dictionary["directions1"] as? String
        self.ell_programs=dictionary["ell_programs"] as? String
        self.extracurricular_activities=dictionary["extracurricular_activities"] as? String
        self.fax_number=dictionary["fax_number"] as? String
        self.finalgrades=dictionary["finalgrades"] as? String
        self.grade9geapplicants1=dictionary["grade9geapplicants1"] as? String
        self.grade9geapplicantsperseat1=dictionary["grade9geapplicantsperseat1"] as? String
        self.grade9gefilledflag1=dictionary["grade9gefilledflag1"] as? String
        self.grade9swdapplicants1=dictionary["grade9swdapplicants1"] as? String
        self.grade9swdapplicantsperseat1=dictionary["grade9swdapplicantsperseat1"] as? String
        self.grade9swdfilledflag1=dictionary["grade9swdfilledflag1"] as? String
        self.grades2018=dictionary["grades2018"] as? String
        self.interest1=dictionary["interest1"] as? String
        self.language_classes=dictionary["language_classes"] as? String
        self.latitude=dictionary["latitude"] as? String
        self.location=dictionary["location"] as? String
        self.longitude=dictionary["longitude"] as? String
        self.method1=dictionary["method1"] as? String
        self.neighborhood=dictionary["neighborhood"] as? String
        self.nta=dictionary["nta"] as? String
        self.overview_paragraph=dictionary["overview_paragraph"] as? String
        self.pct_stu_enough_variety=dictionary["pct_stu_enough_variety"] as? String
        self.pct_stu_safe=dictionary["pct_stu_safe"] as? String
        self.phone_number=dictionary["phone_number"] as? String
        self.primary_address_line_1=dictionary["primary_address_line_1"] as? String
        self.program1=dictionary["program1"] as? String
        self.school_10th_seats=dictionary["school_10th_seats"] as? Double
        self.school_email=dictionary["school_email"] as? String
        self.school_name=dictionary["school_name"] as? String
        self.school_sports=dictionary["school_sports"] as? String
        self.seats101=dictionary["seats101"] as? String
        self.seats9ge1=dictionary["seats9ge1"] as? String
        self.seats9swd1=dictionary["seats9swd1"] as? String
        self.state_code=dictionary["state_code"] as? String
        self.subway=dictionary["subway"] as? String
        self.total_students=dictionary["total_students"] as? Double
        self.transfer=dictionary["transfer"] as? Double
        self.website=dictionary["website"] as? String
        self.zip=dictionary["zip"] as? Double
    }
    
}
