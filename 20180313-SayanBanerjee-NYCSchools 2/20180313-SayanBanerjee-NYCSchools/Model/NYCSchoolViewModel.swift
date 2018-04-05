//
//  NYCSchoolModelView
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class NYCSchoolModelView: NSObject {

    private var school: NYCSchool? = nil
    private var schoolSat: NYCSchoolSat? = nil
    static private var arrNYCSchoolSat: [NYCSchoolSat] = []
    
    var arrNYCSchools: [NYCSchoolModelView] = []
    var completion: Completion? = nil
    
    func getSchoolList(_ url: String, completion:@escaping Completion) {
        self.completion = completion
        NYCSchoolApi.fetchSchoolListfor(url) { [weak self] (response, error) in
            guard let `self` = self else { return }
            if let response = response {
                self.parseSchool(response as! Data)
            }
        }
    }
    
    func parseSchool(_ response: Data) {
        
        do{
            let responseArray = try JSONSerialization.jsonObject(with: response as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Data received from server  = \(responseArray)")
            guard let schoolArray = (responseArray as? Array<Any>) else { return }
            for dict in schoolArray{
                let school: NYCSchool = NYCSchool(dict as! Dictionary<String, Any>)
                let schoolViewModel: NYCSchoolModelView = NYCSchoolModelView()
                schoolViewModel.school = school
                arrNYCSchools.append(schoolViewModel)
            }
            
            if let completion = self.completion {
                completion(arrNYCSchools, nil)
            }
            
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
    
    func getSatScore(_ url: String) {
        
        NYCSchoolApi.fetchSchoolListfor(url) { [weak self] (response, error) in
            guard let `self` = self else { return }
            if let response = response {
                self.parseSat(response as! Data)
            }
        }
    }
    
    func parseSat(_ response: Data) {
        
        do{
            let responseArray = try JSONSerialization.jsonObject(with: response as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Data received from server  = \(responseArray)")
            guard let schoolSatArray = (responseArray as? Array<Any>) else { return }
            for dict in schoolSatArray{
                let schoolSat: NYCSchoolSat = NYCSchoolSat(dict as! Dictionary<String, Any>)
                NYCSchoolModelView.arrNYCSchoolSat.append(schoolSat)
            }
            
            if let completion = self.completion {
                completion(arrNYCSchools, nil)
            }
            
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
    
    //MARK: UI Helper Methods | School List
    
    var title: String {
        guard let school = self.school else { return ""}
        return school.school_name ?? ""
    }
    
    var schoolDescription: String {
        guard let school = self.school else { return ""}
        return school.overview_paragraph ?? ""
    }
    
    //MARK: UI Helper Methods | School Sat
    
    func setSchoolSat() {
        schoolSat = NYCSchoolModelView.arrNYCSchoolSat.filter { $0.dbn == self.school?.dbn }.first ?? NYCSchoolModelView.arrNYCSchoolSat.first
    }
    
    var dbn: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "DBN: %@", schoolSat.dbn ?? "")
    }
    
    var numberOfSat: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "School Sat: %@", schoolSat.num_of_sat_test_takers ?? "")
    }
    
    var satCritical: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "Sat Critical: %@", schoolSat.sat_critical_reading_avg_score ?? "")
    }
    
    var satMath: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "Sat Math: %@", schoolSat.sat_math_avg_score ?? "")
    }
    
    var satWriting: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "Sat Writing: %@", schoolSat.sat_writing_avg_score ?? "")
    }
    
    var schoolName: String {
        guard let schoolSat = self.schoolSat else { return ""}
        return String(format: "School Name: %@", schoolSat.school_name ?? "")
    }
    
}


