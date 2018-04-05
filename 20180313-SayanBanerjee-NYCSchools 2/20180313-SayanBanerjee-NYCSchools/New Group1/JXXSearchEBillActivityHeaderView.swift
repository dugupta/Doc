//
//  JXXSearchEBillActivityHeaderView.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 4/4/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

protocol JXXSearchEBillActivityHeaderProtocol: AnyObject {
  func filterObjectWith(_ searchString: String?)
}

class JXXSearchEBillActivityHeaderView: UITableViewHeaderFooterView, ReusableView, NibLoadableView {
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!
  
  weak var delegate: JXXSearchEBillActivityHeaderProtocol?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    searchTextField.delegate = self
    countLabel.text = nil
  }
}


extension JXXSearchEBillActivityHeaderView: UITextFieldDelegate {
//  public func textFieldDidBeginEditing(_ textField: UITextField) {
//    print(textField.text ?? "")
//  }
//  
//  func textFieldDidEndEditing(_ textField: UITextField) {
//    print(textField.text ?? "")
//    delegate?.filterObjectWith(textField.text)
//  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    delegate?.filterObjectWith(textField.text)
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("Input text is \(String(describing: (textField.text as NSString?)?.replacingCharacters(in: range, with: string)))")
    let searchString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
    delegate?.filterObjectWith(searchString)
    return true
  }
}
