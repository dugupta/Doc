//
//  LandingViewController.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class NYCSchoolLandingViewController: UIViewController, BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var schoolListTableView: UITableView!
    var dataObject: NYCSchoolModelView = NYCSchoolModelView()
    var selectedSchool: NYCSchoolModelView = NYCSchoolModelView()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            let vc = segue.destination as! NYCSchoolDetailViewController
            vc.dataObject = selectedSchool
        }
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolListTableView.estimatedRowHeight = 44.0
        self.schoolListTableView.rowHeight = UITableViewAutomaticDimension
        self.fetchSchoolList()
        self.fetchSatScore()
    }

}

extension NYCSchoolLandingViewController {
    
    func fetchSchoolList() {
        self.apiListCallWith(NYCSchoolHelper.schoolListUrl())
    }
    
    func apiListCallWith(_ string: String) {
        showSpinner()
        self.dataObject.getSchoolList(string) { [weak self] (response, error) in
            guard let `self` = self else { return }
            self.hideSpinner()
            if response != nil {
                DispatchQueue.main.async {
                    self.schoolListTableView.reloadData()
                }
            } else {
                self.showMessage(error.debugDescription, title: "Error")
            }
        }
    }
    
    func fetchSatScore() {
         self.dataObject.getSatScore(NYCSchoolHelper.satScoreListUrl())
    }
}

extension NYCSchoolLandingViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.arrNYCSchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object: NYCSchoolModelView = dataObject.arrNYCSchools[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? NYCSchoolCell {
            cell.bind(user: object)
            return cell
        }
        return UITableViewCell()
    }
}

extension NYCSchoolLandingViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedSchool = dataObject.arrNYCSchools[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
}
