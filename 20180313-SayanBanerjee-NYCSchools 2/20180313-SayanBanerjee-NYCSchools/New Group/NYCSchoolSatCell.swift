//
//  NYCSchoolSatCell.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class NYCSchoolSatCell: UITableViewCell {

    @IBOutlet weak private var dbnLabel: UILabel!
    @IBOutlet weak private var numberOfSat: UILabel!
    @IBOutlet weak private var satCriticalLabel: UILabel!
    @IBOutlet weak private var satMathLabel: UILabel!
    @IBOutlet weak private var satWritingLabel: UILabel!
    @IBOutlet weak private var schoolNameLabel: UILabel!
    
    var dataObject: NYCSchoolModelView = NYCSchoolModelView() {
        didSet {
            dataObject.setSchoolSat()
            self.updateUI()
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI() {
        dbnLabel.text = dataObject.dbn
        numberOfSat.text = dataObject.numberOfSat
        satCriticalLabel.text = dataObject.satCritical
        satMathLabel.text = dataObject.satMath
        satWritingLabel.text = dataObject.satWriting
        schoolNameLabel.text = dataObject.schoolName
    }

}

