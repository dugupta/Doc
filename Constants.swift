
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
}

extension UITableView {
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
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






//
//  ProtocolViewController.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Durgesh Lal Gupta on 4/1/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

enum ObjectType{
  case type1
  case type2
  case type3
}

class MyObject: NSObject {
  var type : ObjectType
  let id: Int
  init(type: ObjectType, id: Int) {
    self.type = type
    self.id = id
  }
}

class ProtocolViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
      super.viewDidLoad()
      tableView.estimatedRowHeight = 44
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(FoodTableViewCell.self)
      //tableView.tableHeaderView = createTableHeader()
    
    let array = [MyObject(type: .type1, id: 1),
                 MyObject(type: .type2, id: 2),
                 MyObject(type: .type3, id: 3),
                 MyObject(type: .type2, id: 4),
                 MyObject(type: .type3, id: 5)]
    
    let type2Array = array.filter { $0.type == .type2}
    type2Array.forEach { print($0.id) } // 2, 4
    
    }
  
  func createTableHeader() -> UIView {
    let headerView = UIView()
    
    headerView.backgroundColor = .green
    //tableView.contentInset = UIEdgeInsetsMake(-55, 0, 0, 0)
    return headerView
  }
}

extension ProtocolViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     return tableView.dequeueReusableCell(forIndexPath: indexPath) as FoodTableViewCell
  }
  
}

extension ProtocolViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      return createTableHeader()
  }
}

protocol ReusableFilter: class { }

extension ReusableFilter  {
  static var propertyOne: String {
    return "propertyOne"
  }
  
  static var searchString: String {
    return "searchString"
  }
}
extension Array {
  
  func filter<U>(_ objects: [U]) -> U where U: ReusableFilter {
    //let filteredObjects = objects.filter { $0.searchString == T.propertyOne }
    return objects.first!
  }
  
}




struct IntStack<AnyElement> {
  var items = [AnyElement]()
  mutating func push(_ item: AnyElement) {
    items.append(item)
  }
  mutating func pop() -> AnyElement {
    return items.removeLast()
  }
}


struct Rectangle {
  var width = 1
  var height = 1
  
  mutating func area() -> Int {
    width = width * height
    return width
  }
}
