//
//  UserBindable.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 3/26/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import Foundation
import UIKit

protocol UserBindable: AnyObject {
  var user: NYCSchoolModelView? { get set }
  var titleLabel: UILabel! { get }
  var descriptionLabel: UILabel! { get }
}

extension UserBindable {
  // Make the views optionals
  var titleLabel: UILabel! {
    return nil
  }
  
  var descriptionLabel: UILabel! {
    return nil
  }
  
  func bind(user: NYCSchoolModelView) {
    self.user = user
    bind()
  }
  
  func bind() {
    guard let user = self.user else {
      return
    }
    if let titleLabel = self.titleLabel {
      titleLabel.text = user.title
    }
    if let descriptionLabel = self.descriptionLabel {
      descriptionLabel.text = user.schoolDescription
    }
  }
}
