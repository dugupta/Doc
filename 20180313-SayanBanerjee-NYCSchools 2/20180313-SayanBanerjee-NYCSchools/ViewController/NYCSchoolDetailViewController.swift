//
//  NYCSchoolDetailViewController.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NYCSchoolDetailViewController: UIViewController, BaseViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var schoolSatTableView: UITableView!
    var dataObject: NYCSchoolModelView = NYCSchoolModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataObject.title
        self.schoolSatTableView.estimatedRowHeight = 44.0
        self.schoolSatTableView.rowHeight = UITableViewAutomaticDimension
        self.schoolSatTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.schoolSatTableView.reloadData()
    }
}


extension NYCSchoolDetailViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "schoolSatCell", for: indexPath) as? NYCSchoolSatCell {
            cell.dataObject = dataObject
            return cell
        }
        return UITableViewCell()
    }
}
