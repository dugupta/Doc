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
  
  var expandedHeader: Bool = false
  var headerView: JXXSearchEBillActivityHeaderView = JXXSearchEBillActivityHeaderView()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      tableView.estimatedRowHeight = 44
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(FoodTableViewCell.self)
      tableView.registerHeader(JXXSearchEBillActivityHeaderView.self)
    
      //tableView.tableHeaderView = createTableHeader()
    
    let array = [MyObject(type: .type1, id: 1),
                 MyObject(type: .type2, id: 2),
                 MyObject(type: .type3, id: 3),
                 MyObject(type: .type2, id: 4),
                 MyObject(type: .type3, id: 5)]
    
    let type2Array = array.filter { $0.type == .type2}
    type2Array.forEach { print($0.id) } // 2, 4
    
    
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
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return expandedHeader ? 101 : 51
  }
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let header = tableView.dequeueHeaderView() as JXXSearchEBillActivityHeaderView
    header.delegate = self
    headerView = header
    return header
  }
}

extension ProtocolViewController: JXXSearchEBillActivityHeaderProtocol {
  func filterObjectWith(_ searchString: String?) {
    expandedHeader = searchString != nil && searchString != ""
    if let string = searchString {
      headerView.countLabel.text = "Total activity count: \(string)"
    }
    tableView.reloadData()
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


  
  func createTableHeader() -> UIView {
    
    var containerView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .orange
      return view
    }
    
    var topView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .darkGray
      return view
    }
    
    var searchIconImageView: UIImageView {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.image = UIImage(named: "search")
      return imageView
    }
    
    var searchTextFiled: UITextField {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      return textField
    }
    
    var bottomView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .darkGray
      return view
    }
    
    var countLabel: UILabel {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.backgroundColor = .green
      return label
    }
    
    containerView.addSubview(topView)
    containerView.addSubview(bottomView)
    topView.addSubview(searchIconImageView)
    topView.addSubview(searchTextFiled)
    bottomView.addSubview(countLabel)
    
    let views = ["containerView": containerView,
                 "topView": topView,
                 "bottomView": bottomView,
                 "searchIconImageView": searchIconImageView,
                 "searchTextFiled": searchTextFiled,
                 "countLabel": countLabel]
    
    var allConstraints: [NSLayoutConstraint] = []
    
    let topViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[topView]-0-|", metrics: nil, views: views)
    allConstraints += topViewHorizontalConstraints
    
    let topViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[topView(47)][bottomView]|", metrics: nil, views: views)
    allConstraints += topViewVerticalConstraints
    
    let searchIconImageViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[searchIconImageView(20)]-8-[searchTextFiled]-20-|", metrics: nil, views: views)
    allConstraints += searchIconImageViewHorizontalConstraints
    
    let searchTextFiledVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[searchTextFiled(44)]|", options: [.alignAllCenterY], metrics: nil, views: views)
    allConstraints += searchTextFiledVerticalConstraints
    
    return containerView
  }


class HeaderView: UIView {
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }
  
  func configureView() {
    
    var containerView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .orange
      return view
    }
    
    var topView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .darkGray
      return view
    }
    
    var searchIconImageView: UIImageView {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.image = UIImage(named: "search")
      return imageView
    }
    
    var searchTextFiled: UITextField {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      return textField
    }
    
    var bottomView: UIView {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .darkGray
      return view
    }
    
    var countLabel: UILabel {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.backgroundColor = .green
      return label
    }
    addSubview(containerView)
    containerView.addSubview(topView)
    containerView.addSubview(bottomView)
    topView.addSubview(searchIconImageView)
    topView.addSubview(searchTextFiled)
    bottomView.addSubview(countLabel)
    
    let views = ["containerView": containerView,
                 "topView": topView,
                 "bottomView": bottomView,
                 "searchIconImageView": searchIconImageView,
                 "searchTextFiled": searchTextFiled,
                 "countLabel": countLabel]
    
    var allConstraints: [NSLayoutConstraint] = []
    
    let topViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[topView]|", metrics: nil, views: views)
    allConstraints += topViewHorizontalConstraints
    
    let topViewVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[topView(47)][bottomView]|", metrics: nil, views: views)
    allConstraints += topViewVerticalConstraints
    
    let searchIconImageViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[searchIconImageView(20)]-8-[searchTextFiled]-20-|", metrics: nil, views: views)
    allConstraints += searchIconImageViewHorizontalConstraints
    
    let searchTextFiledVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[searchTextFiled(44)]|", options: [.alignAllCenterY], metrics: nil, views: views)
    allConstraints += searchTextFiledVerticalConstraints
    
  }
  


}
