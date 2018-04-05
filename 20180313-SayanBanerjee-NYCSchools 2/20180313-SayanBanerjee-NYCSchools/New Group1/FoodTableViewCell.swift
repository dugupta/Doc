//
//  FoodTableViewCell.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 4/1/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension FoodTableViewCell: ReusableView, NibLoadableView { }

extension UITableView {
  
  func register<T: UITableViewCell> (_: T.Type) where T: ReusableView & NibLoadableView {
    let nib = UINib(nibName: T.NibName, bundle: nil)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerHeader<T: UITableViewHeaderFooterView> (_: T.Type) where T: ReusableView & NibLoadableView {
    let nib = UINib(nibName: T.NibName, bundle: nil)
    register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
  }
}

extension UITableView {
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
  func dequeueHeaderView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return view
  }
}

protocol ReusableView: class {}
extension ReusableView where Self: UIView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
  static var NibName: String {
    return String(describing: self)
  }
}
