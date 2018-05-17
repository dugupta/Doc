
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

















struct newStruct {
    
    func foo() -> Void {
        SpaceCraft(warpCode: "hello").fileprivatewarpCode
    }
    
    
    
    
    /*
     Fetch List of Account
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/options/list
     
     * accountOptionId: 0
     * accountOptionType: DEBIT
     * includeBrokerageAccounts: true

     {"code":"SUCCESS","accountOptions":[{"accountCategory":"OTHER","availableBalance":62.43,"brokerageEligible":false,"id":649244560,"external":false,"label":"FINN CHECKING (...5896)"},{"accountCategory":"OTHER","availableBalance":316.94,"brokerageEligible":false,"id":649244561,"external":false,"label":"FINN SAVINGS (...5578)"},{"accountCategory":"OTHER","availableBalance":4952.64,"brokerageEligible":false,"id":598398010,"external":false,"label":"TOTAL CHECKING (...8718)"}],"billPayInd":true}
     
     
     {"code":"SUCCESS","accountOptions":[{"accountCategory":"OTHER","availableBalance":62.43,"brokerageEligible":false,"id":649244560,"external":false,"label":"FINN CHECKING (...5896)"},{"accountCategory":"OTHER","availableBalance":4952.64,"brokerageEligible":false,"id":598398010,"external":false,"label":"TOTAL CHECKING (...8718)"}],"billPayInd":false,"debitAccountCategory":"OTHER","eligibleRepeating":true,"isDebitAccountExternal":false,"regDFee":true,"texasHomestead":false}
 */
    
    
    class JMTransferAccountOption: NSObject {
        
        var billPayInd: Bool = false
        var eligibleRepeating: Bool = false
        var isDebitAccountExternal: Bool = false
        var regDFee: Bool = false
        var texasHomestead: Bool = false
        
        var debitAccountCategory: String?
        var accountOptions: [JMTransferAccount]?
        
        let value  = ["billPayInd": "billPayInd",
                      "debitAccountCategory": "debitAccountCategory",
                      "eligibleRepeating": "eligibleRepeating",
                      "isDebitAccountExternal": "isDebitAccountExternal",
                      "regDFee": "regDFee",
                      "texasHomestead": "texasHomestead"]
        
        class JMTransferAccount: NSObject {
            
            var id: String?
            var label: String?
            var accountCategory: String?
            var availableBalance: String?
            
            var external: Bool = false
            var brokerageEligible: Bool = false
            
            let value = ["accountCategory": "accountCategory",
                         "availableBalance": "availableBalance",
                         "brokerageEligible": "brokerageEligible",
                         "id": "id",
                         "external": "external",
                         "label": "label"]
            
        }
    }
    
    /*
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/update/options/list
     
     * debitAccountOptionId: 0
     * paymentId: 7059871626
     
     {"code":"SUCCESS","addExternalDebitAccount":true,"debitAccountOptions":[{"availableBalance":73.58,"id":649244560,"external":false,"label":"FINN CHECKING (...5896)"},{"availableBalance":9931.31,"id":598398010,"external":false,"label":"TOTAL CHECKING (...8718)"}],"detail":{"transferAmount":1.00,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountId":598398010,"dueDate":"20190409","memo":"Testing transfer","paymentId":7059871626,"processDate":"20190409","token":1523590379000},"legalFootnote":false,"options":{"cutOffTime":"23:00","dateOptions":[{"dueDate":"20180416"},{"dueDate":"20180417"},{"dueDate":"20180418"},{"dueDate":"20180419"},{"dueDate":"20180420"},{"dueDate":"20180423"},{"dueDate":"20180424"},{"dueDate":"20180425"},{"dueDate":"20180426"},{"dueDate":"20180427"},{"dueDate":"20180430"},{"dueDate":"20180501"},{"dueDate":"20180502"},{"dueDate":"20180503"},{"dueDate":"20180504"},{"dueDate":"20180507"},{"dueDate":"20180508"},{"dueDate":"20180509"},{"dueDate":"20180510"},{"dueDate":"20180511"},{"dueDate":"20180514"},{"dueDate":"20180515"},{"dueDate":"20180516"},{"dueDate":"20180517"},{"dueDate":"20180518"},{"dueDate":"20180521"},{"dueDate":"20180522"},{"dueDate":"20180523"},{"dueDate":"20180524"},{"dueDate":"20180525"},{"dueDate":"20180529"},{"dueDate":"20180530"},{"dueDate":"20180531"},{"dueDate":"20180601"},{"dueDate":"20180604"},{"dueDate":"20180605"},{"dueDate":"20180606"},{"dueDate":"20180607"},{"dueDate":"20180608"},{"dueDate":"20180611"},{"dueDate":"20180612"},{"dueDate":"20180613"},{"dueDate":"20180614"},{"dueDate":"20180615"},{"dueDate":"20180618"},{"dueDate":"20180619"},{"dueDate":"20180620"},{"dueDate":"20180621"},{"dueDate":"20180622"},{"dueDate":"20180625"},{"dueDate":"20180626"},{"dueDate":"20180627"},{"dueDate":"20180628"},{"dueDate":"20180629"},{"dueDate":"20180702"},{"dueDate":"20180703"},{"dueDate":"20180705"},{"dueDate":"20180706"},{"dueDate":"20180709"},{"dueDate":"20180710"},{"dueDate":"20180711"},{"dueDate":"20180712"},{"dueDate":"20180713"},{"dueDate":"20180716"},{"dueDate":"20180717"},{"dueDate":"20180718"},{"dueDate":"20180719"},{"dueDate":"20180720"},{"dueDate":"20180723"},{"dueDate":"20180724"},{"dueDate":"20180725"},{"dueDate":"20180726"},{"dueDate":"20180727"},{"dueDate":"20180730"},{"dueDate":"20180731"},{"dueDate":"20180801"},{"dueDate":"20180802"},{"dueDate":"20180803"},{"dueDate":"20180806"},{"dueDate":"20180807"},{"dueDate":"20180808"},{"dueDate":"20180809"},{"dueDate":"20180810"},{"dueDate":"20180813"},{"dueDate":"20180814"},{"dueDate":"20180815"},{"dueDate":"20180816"},{"dueDate":"20180817"},{"dueDate":"20180820"},{"dueDate":"20180821"},{"dueDate":"20180822"},{"dueDate":"20180823"},{"dueDate":"20180824"},{"dueDate":"20180827"},{"dueDate":"20180828"},{"dueDate":"20180829"},{"dueDate":"20180830"},{"dueDate":"20180831"},{"dueDate":"20180904"},{"dueDate":"20180905"},{"dueDate":"20180906"},{"dueDate":"20180907"},{"dueDate":"20180910"},{"dueDate":"20180911"},{"dueDate":"20180912"},{"dueDate":"20180913"},{"dueDate":"20180914"},{"dueDate":"20180917"},{"dueDate":"20180918"},{"dueDate":"20180919"},{"dueDate":"20180920"},{"dueDate":"20180921"},{"dueDate":"20180924"},{"dueDate":"20180925"},{"dueDate":"20180926"},{"dueDate":"20180927"},{"dueDate":"20180928"},{"dueDate":"20181001"},{"dueDate":"20181002"},{"dueDate":"20181003"},{"dueDate":"20181004"},{"dueDate":"20181005"},{"dueDate":"20181009"},{"dueDate":"20181010"},{"dueDate":"20181011"},{"dueDate":"20181012"},{"dueDate":"20181015"},{"dueDate":"20181016"},{"dueDate":"20181017"},{"dueDate":"20181018"},{"dueDate":"20181019"},{"dueDate":"20181022"},{"dueDate":"20181023"},{"dueDate":"20181024"},{"dueDate":"20181025"},{"dueDate":"20181026"},{"dueDate":"20181029"},{"dueDate":"20181030"},{"dueDate":"20181031"},{"dueDate":"20181101"},{"dueDate":"20181102"},{"dueDate":"20181105"},{"dueDate":"20181106"},{"dueDate":"20181107"},{"dueDate":"20181108"},{"dueDate":"20181109"},{"dueDate":"20181113"},{"dueDate":"20181114"},{"dueDate":"20181115"},{"dueDate":"20181116"},{"dueDate":"20181119"},{"dueDate":"20181120"},{"dueDate":"20181121"},{"dueDate":"20181123"},{"dueDate":"20181126"},{"dueDate":"20181127"},{"dueDate":"20181128"},{"dueDate":"20181129"},{"dueDate":"20181130"},{"dueDate":"20181203"},{"dueDate":"20181204"},{"dueDate":"20181205"},{"dueDate":"20181206"},{"dueDate":"20181207"},{"dueDate":"20181210"},{"dueDate":"20181211"},{"dueDate":"20181212"},{"dueDate":"20181213"},{"dueDate":"20181214"},{"dueDate":"20181217"},{"dueDate":"20181218"},{"dueDate":"20181219"},{"dueDate":"20181220"},{"dueDate":"20181221"},{"dueDate":"20181224"},{"dueDate":"20181226"},{"dueDate":"20181227"},{"dueDate":"20181228"},{"dueDate":"20181231"},{"dueDate":"20190102"},{"dueDate":"20190103"},{"dueDate":"20190104"},{"dueDate":"20190107"},{"dueDate":"20190108"},{"dueDate":"20190109"},{"dueDate":"20190110"},{"dueDate":"20190111"},{"dueDate":"20190114"},{"dueDate":"20190115"},{"dueDate":"20190116"},{"dueDate":"20190117"},{"dueDate":"20190118"},{"dueDate":"20190122"},{"dueDate":"20190123"},{"dueDate":"20190124"},{"dueDate":"20190125"},{"dueDate":"20190128"},{"dueDate":"20190129"},{"dueDate":"20190130"},{"dueDate":"20190131"},{"dueDate":"20190201"},{"dueDate":"20190204"},{"dueDate":"20190205"},{"dueDate":"20190206"},{"dueDate":"20190207"},{"dueDate":"20190208"},{"dueDate":"20190211"},{"dueDate":"20190212"},{"dueDate":"20190213"},{"dueDate":"20190214"},{"dueDate":"20190215"},{"dueDate":"20190219"},{"dueDate":"20190220"},{"dueDate":"20190221"},{"dueDate":"20190222"},{"dueDate":"20190225"},{"dueDate":"20190226"},{"dueDate":"20190227"},{"dueDate":"20190228"},{"dueDate":"20190301"},{"dueDate":"20190304"},{"dueDate":"20190305"},{"dueDate":"20190306"},{"dueDate":"20190307"},{"dueDate":"20190308"},{"dueDate":"20190311"},{"dueDate":"20190312"},{"dueDate":"20190313"},{"dueDate":"20190314"},{"dueDate":"20190315"},{"dueDate":"20190318"},{"dueDate":"20190319"},{"dueDate":"20190320"},{"dueDate":"20190321"},{"dueDate":"20190322"},{"dueDate":"20190325"},{"dueDate":"20190326"},{"dueDate":"20190327"},{"dueDate":"20190328"},{"dueDate":"20190329"},{"dueDate":"20190401"},{"dueDate":"20190402"},{"dueDate":"20190403"},{"dueDate":"20190404"},{"dueDate":"20190405"},{"dueDate":"20190408"},{"dueDate":"20190409"},{"dueDate":"20190410"},{"dueDate":"20190411"},{"dueDate":"20190412"}],"eligibleFuture":true,"eligibleRepeating":true,"isDebitAccountExternal":false,"regDFee":false,"texasHomestead":false}}
     
 
 */
    
    class JMTransferUpdateOption: NSObject {
        
        let value = ["eligibleFuture": "eligibleFuture",
        "eligibleRepeating": "eligibleRepeating",
        "isDebitAccountExternal": "isDebitAccountExternal",
        "regDFee": "regDFee",
        "texasHomestead": "texasHomestead",
        "legalFootnote": "legalFootnote",
        "addExternalDebitAccount": "addExternalDebitAccount"]
        
        
        var eligibleFuture: Bool = false
        var eligibleRepeating: Bool = false
        var isDebitAccountExternal: Bool = false
        var regDFee: Bool = false
        var texasHomestead: Bool = false
        var legalFootnote: Bool = false
        var addExternalDebitAccount: Bool = false
        var debitAccountOptions: [JMTransferFundingAccount]?
        
        //detail
        class JMTransferUpdateOptionDetail: NSObject {
            
            var transferAmount: String?
            var creditAccountName: String?
            var debitAccountId: String?
            var dueDate: String?
            var memo: String?
            var paymentId: String?
            var processDate: String?
            var token: String?
            
            let value = ["transferAmount": "transferAmount",
                         "creditAccountName": "creditAccountName",
                         "debitAccountId": "debitAccountId",
                         "dueDate": "dueDate",
                         "memo": "memo",
                         "paymentId": "paymentId",
                         "processDate": "processDate",
                         "token": "token"]
        }
        
        //options
        class JMTransferOption: NSObject {
            //dateOptions
            var cutOffTime: String?
            var dateOptions: [JMTransferDateOption]?
            
            let value = ["cutOffTime": "cutOffTime"]
            
            class JMTransferDateOption: NSObject {
                var dueDate: String?
                let value = ["dueDate": "dueDate"]
            }
        }
        
        class JMTransferFundingAccount: NSObject {
            var availableBalance: String?
            var id: String?
            var label: String?
            var external: Bool = false
            
            let valuse = ["availableBalance": "availableBalance",
                          "id": "id",
                          "external": "external",
                          "label": "label"]
        }
    }
    
    
    /*
     Single Set up
     Validate
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/validate
     
     * amount: 0.23
     * creditAccountOptionId: 649244561
     * debitAccountOptionId: 649244560
     * dueDate: 02/21/2019
     * memo: Single payment for testing
     
     {"code":"SUCCESS","amount":0.23,"cutOffTime":"23:00","creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","displayCutOff":false,"dueDate":"20190221","formId":"OhGTruSPxD","memo":"Single payment for testing"}
     
     
     Add
     
     https://secure07a.chase.com/svc/wr/payments/secure/v1/transfer/account/xfer/add
     
     formId: OhGTruSPxD
     {"code":"SUCCESS","amount":0.23,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","dueDate":"20190221","memo":"Single payment for testing","paymentId":7153600818,"status":"PENDING"}
     
     
     Edit
     
     Validate: https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/update/validate
     * transferAmount: 1.00
     * debitAccountOptionId: 598398010
     * processDate:
     * dueDate: 20190409
     * paymentId: 7059871626
     * memo: Testing transfer
     
     Repeat Payment Edit Single:
     
     transferAmount: 0.31
     debitAccountOptionId: 649244560
     processDate:
     dueDate: 20190102
     paymentId: 7153747737
     memo: Repeat Payment Testing
     
     
     {"code":"SUCCESS","transferAmount":1.00,"creditAccountName":"FINN SAVINGS (...5578)","cutOffTime":"23:00","debitAccountName":"TOTAL CHECKING (...8718)","dueDate":"20190409","formId":"TzFVRWeJgQ","memo":"Testing transfer"}
     
     Edit confirm:
     
     https://secure07a.chase.com/svc/wr/payments/secure/v1/transfer/account/xfer/update
     
     * formId: TzFVRWeJgQ
     * token: 1523590379000
     
     
     {"code":"SUCCESS","transferAmount":1.00,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"TOTAL CHECKING (...8718)","displayPaymentId":true,"dueDate":"20190409","legalFootnote":false,"memo":"Testing transfer","paymentId":7059871626,"status":"PENDING"}
     
     
     Repeat Payment Set up
     
     Validate
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/repeating/xfer/validateadd
     
     * debitAccountOptionId: 649244560
     * creditAccountOptionId: 649244561
     * frequency: YEARLY
     * numTransfers: 6
     * openEnded: false
     * month: JAN
     * dayOfMonth: TWO
     * earliestDueDate: 20190102
     * numPayments: 6
     * amount: 0.35
     * memo: Repeat Payment Testing
     *
     
     {"code":"SUCCESS","form":{"amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","formId":"JuILvUjaok","legalFootnote":false,"memo":"Repeat Payment Testing","model":{"dayOfMonth":"TWO","frequency":"YEARLY","month":"JAN","numPayments":6,"openEnded":false},"regDFee":false,"scheduledDates":[{"dueDate":"20190102"},{"dueDate":"20200102"},{"dueDate":"20210101"},{"dueDate":"20211231"},{"dueDate":"20230102"},{"dueDate":"20240102"}]}}
     
     Add
     
     https://secure07a.chase.com/svc/wr/payments/secure/v1/transfer/account/repeating/xfer/add
     
     formId: JuILvUjaok
     
     {"code":"SUCCESS","amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","displayPaymentId":true,"legalFootnote":false,"memo":"Repeat Payment Testing","model":{"dayOfMonth":"TWO","frequency":"YEARLY","month":"JAN","numPayments":6,"openEnded":false},"scheduledPaymentDueDate":"20190102","scheduledPaymentId":7153747737,"scheduledPaymentStatus":"PENDING"}

     
     
     Repeat Edit Single
     
     Edit Repeat Single
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/update/type/options/list
     paymentId: 7153747737
     
     {
     "code":"SUCCESS",
     "paymentId":7153747737,
     "repeatingModelId":7153747736
     }
      And rest is same Edit Single Option -> Validate -> Confirm
     
     Edit Series
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/update/type/options/list
     paymentId: 7153747737
     
     {
     "code":"SUCCESS",
     "paymentId":7153747737,
     "repeatingModelId":7153747736
     }
     
     
     Option Call
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/repeating/xfer/update/options/list
     repeatingModelId: 7153747736
     
     {
     "code":"SUCCESS",
     "amount":0.35,
     "creditAccountName":"FINN SAVINGS (...5578)",
     "dateOptions":[
     {
     "dueDate":"20190102",
     "processDate":"20190102"
     }
     ],
     "debitAccountName":"FINN CHECKING (...5896)",
     "legalFootNote":false,
     "memo":"Repeat Payment Testing",
     "model":{
     "dayOfMonth":"TWO",
     "frequency":"YEARLY",
     "month":"JAN",
     "numPayments":5,
     "openEnded":false
     },
     "nextScheduleDueDate":"20190102",
     "repeatingModelId":7153747736,
     "token":1526535273000
     }
     
     Then Option List call and date preview call like repeat payment
     
     Repeat Payment Validate Call
     
     https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/repeating/xfer/update/validate
     
     creditAccountOptionId:
     debitAccountOptionId:
     frequency: YEARLY
     numTransfers:
     openEnded: false
     repeatingModelId: 7153747736
     dueDate: 20190102
     month: JAN
     dayOfMonth: TWO
     amount: 0.35
     memo: Repeat Payment Testing
     token: 1526535273000
     numPayments: 5
     
     
    {"code":"SUCCESS","form":{"amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","formId":"YKHDPLsQzF","legalFootnote":false,"memo":"Repeat Payment Testing","model":{"dayOfMonth":"TWO","frequency":"YEARLY","month":"JAN","numPayments":5,"openEnded":false},"regDFee":false,"scheduledDates":[{"dueDate":"20190102"},{"dueDate":"20200102"},{"dueDate":"20210101"},{"dueDate":"20211231"},{"dueDate":"20230102"},{"dueDate":"20240102"}]}}
     
     Confirm call
     
     https://secure07a.chase.com/svc/wr/payments/secure/v1/transfer/account/repeating/xfer/update
     formId: YKHDPLsQzF
     token: 1526535273000
     
     {"code":"SUCCESS","repeatingXfer":{"amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","displayPaymentId":true,"legalFootnote":false,"memo":"Repeat Payment Testing","model":{"dayOfMonth":"TWO","frequency":"YEARLY","month":"JAN","numPayments":5,"openEnded":false},"scheduledPaymentDueDate":"20190102","scheduledPaymentId":7153747737,"scheduledPaymentStatus":"PENDING"}}
     
     
 
 */
    
    class JMTransferSetUpdate: NSObject {
        
        let value = ["amount": "amount",
                     "cutOffTime": "cutOffTime",
                     "creditAccountName": "creditAccountName",
                     "debitAccountName": "debitAccountName",
                     "displayCutOff": "displayCutOff",
                     "dueDate": "dueDate",
                     "formId": "formId",
                     "memo": "memo",
                     "paymentId": "paymentId",
                     "status": "status",
                     "transferAmount": "transferAmount",
                     "displayPaymentId": "displayPaymentId",
                     "legalFootnote": "legalFootnote",
                     "scheduledPaymentDueDate": "scheduledPaymentDueDate",
                     "scheduledPaymentId": "scheduledPaymentId",
                     "scheduledPaymentStatus": "scheduledPaymentStatus",
                     "repeatingModelId": "repeatingModelId",
                     "nextScheduleDueDate": "nextScheduleDueDate",
                     "token": "token"]
        // Single Set up Validate
        var displayCutOff: Bool = false
        
        var memo: String?
        var amount: String?
        var formId: String?
        var dueDate: String?
        var cutOffTime: String?
        var debitAccountName: String?
        var creditAccountName: String?
        var debitAccountCategory: String?
        
        // Single Set up Confirm
        var paymentId: String?
        var status: String?
        
        // Edit Single Validate
        var transferAmount: String?
        
        // Edit Single Confirm
        var displayPaymentId: Bool = false
        var legalFootnote: Bool = false
        
        var totalAmount: String? {
            return amount ?? transferAmount
        }
        
        var paymentDueDate: String? {
            return dueDate ?? scheduledPaymentDueDate
        }
        
        var transactionId: String? {
            return paymentId ?? scheduledPaymentId
        }
        
        var paymentStatus: String? {
            return status ?? scheduledPaymentStatus
        }
        
        // Repeat Payment Set Up Confirm
        
        var scheduledPaymentDueDate: String?
        var scheduledPaymentId: String?
        var scheduledPaymentStatus: String?
        var model: JMTransferSetUpdateRepeatModel?
        
         class JMTransferSetUpdateRepeatModel: NSObject {
            
            var dayOfMonth: String?
            var frequency: String?
            var month: String?
            var numPayments: String?
            var openEnded: Bool = false
            
            let value = ["dayOfMonth": "dayOfMonth",
                         "frequency": "frequency",
                         "month": "month",
                         "numPayments": "numPayments",
                         "openEnded": "openEnded"]
        }
        
        // Repeat Edit Single & Repeat
        var repeatingModelId: String?
        
        // Edit Series
        var nextScheduleDueDate: String?
        var token: String?
        var dateOptions: [JMDate]?
        
        class JMDate: NSObject {
            var dueDate: String?
            var processDate: String?
            let value = ["dueDate": "dueDate",
                         "processDate": "processDate"]
        }
    }
    
    
    /*
    Activity List Call
    Activity call: https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/activity/list
    * creditAccountOptionId: 0
    * debitAccountOptionId: 0
    * dateHi: 30000101
    * dateLo: 10000101
    * frequency: ALL
    * status: ALL
    * sortOrder: DESC
    * sortBy: PROCESS_DATE
    * pageId: 0
    */
    class JMTransferActivityList: NSObject {
        
        /*
         {"code":"SUCCESS","legalFootnote":false,"xfers":[{"amount":1.00,"cancelAllowed":true,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"TOTAL CHECKING (...8718)","inquiryAllowed":false,"paymentDate":{"dueDate":"20190409","processDate":"20190409"},"paymentId":7059871626,"repeatingModelId":0,"status":"PENDING","updateAllowed":true,"updateRepeatingAllowed":false},{"amount":1.86,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712397203,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":1.94,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712374307,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":2.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712447450,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":2.96,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712414346,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":2.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712522845,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":5.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712154335,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":200.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"TOTAL CHECKING (...8718)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6713250734,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":1.18,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"FINN CHECKING (...5896)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171201","processDate":"20171201"},"paymentId":6712480494,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":100.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN CHECKING (...5896)","debitAccountName":"TOTAL CHECKING (...8718)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171023","processDate":"20171023"},"paymentId":6609829572,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false},{"amount":100.00,"cancelAllowed":false,"cancelRepeatingAllowed":false,"creditAccountName":"FINN SAVINGS (...5578)","debitAccountName":"TOTAL CHECKING (...8718)","inquiryAllowed":true,"paymentDate":{"dueDate":"20171023","processDate":"20171023"},"paymentId":6609830337,"repeatingModelId":0,"status":"COMPLETED","updateAllowed":false,"updateRepeatingAllowed":false}]}
 
 */
        
        class JMTransferActivityItem: NSObject {
            
            var status: String?
            var amount: String?
            var paymentId: String?
            var debitAccountName: String?
            var repeatingModelId: String?
            var creditAccountName: String?
            
            var cancelAllowed: Bool = false
            var updateAllowed: Bool = false
            var inquiryAllowed: Bool = false
            var updateRepeatingAllowed: Bool = false
            var cancelRepeatingAllowed: Bool = false
            
            let value = ["amount": "amount",
                         "cancelAllowed": "cancelAllowed",
                         "cancelRepeatingAllowed": "cancelRepeatingAllowed",
                         "creditAccountName": "creditAccountName",
                         "debitAccountName": "debitAccountName",
                         "inquiryAllowed": "inquiryAllowed",
                         "paymentId": "paymentId",
                         "repeatingModelId": "repeatingModelId",
                         "status": "status",
                         "updateAllowed": "updateAllowed",
                         "updateRepeatingAllowed": "updateRepeatingAllowed"]
            
            //paymentDate
            class JMTransferActivityPaymentDate: NSObject {
                var dueDate: String?
                var processDate: String?
                let value = ["dueDate": "dueDate",
                             "processDate": "processDate"]
            }
        }
        
        //xfers
        var legalFootnote: Bool = false
        var xfers: [JMTransferActivityItem]?
    }
}

/*
 https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/activity/detail/list
 paymentId: 7059871626
 
 {"code":"SUCCESS","approvedBy":"Not Available","lastModifiedBy":"Not Available","memo":"Testing transfer","paymentId":7059871626,"status":"PENDING","submittedBy":"Not Available"}
 */

class JMTransferActivityDetail: NSObject {
    
    var memo: String?
    var status: String?
    var paymentId: String?
    var approvedBy: String?
    var submittedBy: String?
    var lastModifiedBy: String?
   
    let value = ["approvedBy": "approvedBy",
                 "lastModifiedBy": "lastModifiedBy",
                 "memo": "memo",
                 "paymentId": "paymentId",
                 "status": "status",
                 "submittedBy": "submittedBy"]
}

/*
 Cancel Single
 https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/xfer/cancel/options/list
 paymentId: 7059871626
 {"code":"SUCCESS","amount":1.00,"memo":"Testing transfer","payment":{"id":7059871626,"token":1523675465000},"scheduledProcessDate":"20190409"}
 
 Cancel Repeat Next payment
 {"code":"SUCCESS","amount":0.35,"memo":"Repeat Payment Testing","payment":{"id":7153747737,"token":1526535842000},"repeatingModel":{"id":7153747736,"token":1526535842000},"scheduledProcessDate":"20190102"}
 
 Cancel Repeat series
 paymentId: 7153769811
 {"code":"SUCCESS","amount":0.35,"memo":"Repeat Payment Testing","payment":{"id":7153769811,"token":1526536097000},"repeatingModel":{"id":7153747736,"token":1526536097000},"scheduledProcessDate":"20200102"}
 
 */


class JMTransferActivityCancelOption: NSObject {
    
    class JMTransferActivityCancelOptionPayment: NSObject {
        var id: String?
        var token: String?
        
        let value = ["id": "id",
                     "token": "token"]
    }
    
    var memo: String?
    var amount: String?
    var scheduledProcessDate: String?
    var payment: JMTransferActivityCancelOptionPayment?
    var repeatingModel: JMTransferActivityCancelOptionPayment?
    
    let value = ["amount": "amount",
                 "memo": "memo",
                 "scheduledProcessDate": "scheduledProcessDate"]
    
}

/*
 Cancel Confirm
 https://secure07a.chase.com/svc/wr/payments/secure/v1/transfer/account/xfer/cancel
 * memo: Testing transfer
 * paymentId: 7059871626
 * paymentToken: 1523675465000
 
 Cancel Repeat Next Payment
 
 {"code":"SUCCESS","amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","legalFootnote":false,"nextScheduledPaymentProcessDate":"20200102","repeating":false,"scheduledPaymentProcessDate":"20190102"}
 
 Cancel Sereies
 
 repeatingModelId: 7153747736
 repeatingModelToken: 1526536097000
 
 {"code":"SUCCESS","amount":0.35,"creditAccountName":"FINN SAVINGS (...5578)","legalFootnote":false,"nextScheduledPaymentProcessDate":"20210101","repeating":false,"scheduledPaymentProcessDate":"20200102"}
 
 
 */

class JMTransferActivityCancelConfirm: NSObject {
    
    var memo: String?
    var amount: String?
    var creditAccountName: String?
    var scheduledPaymentProcessDate: String?
    var nextScheduledPaymentProcessDate: String?
    var repeating: Bool = false
    var legalFootnote: Bool = false
    
    let value = ["memo": "memo",
                 "amount": "amount",
                 "creditAccountName": "creditAccountName",
                 "scheduledPaymentProcessDate": "scheduledPaymentProcessDate",
                 "legalFootnote": "legalFootnote",
                 "repeating": "repeating",
                 "nextScheduledPaymentProcessDate": "nextScheduledPaymentProcessDate"]
    
}




/*
 Repeat Payment Option List Call
 https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/repeating/xfer/date/options/list
 
 
 Weekly
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: WEEKLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfWeek: MON
 
 Every Two Week
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: BIWEEKLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfWeek: MON
 
 Twice Per Month
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: TWICE_MONTHLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfMonth: ONE
 secondDayOfMonth: FIFTEEN
 
 Every 4 Month
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: FOUR_WEEKS
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfWeek: MON
 
 
 Monthly
 
 * debitAccountOptionId: 649244560
 * creditAccountOptionId: 649244561
 * frequency: MONTHLY
 * dayOfMonth: ONE
 * numTransfers: 0
 * openEnded: true
 * includeBrokerageAccounts: true
 
 Every Other Month
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: BIMONTHLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfMonth: ONE
 
 
 Quartelry
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: QUARTERLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfMonth: ONE
 
 Twice Per Year
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: SEMI_ANNUALLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 dayOfMonth: ONE
 
 Yearly
 
 debitAccountOptionId: 649244560
 creditAccountOptionId: 649244561
 frequency: YEARLY
 numTransfers: 6
 openEnded: false
 includeBrokerageAccounts: true
 month: JAN
 dayOfMonth: TWO
 
 
 {"code":"SUCCESS","dateOptions":[{"dueDate":"20180601","processDate":"20180601"},{"dueDate":"20180629","processDate":"20180629"},{"dueDate":"20180801","processDate":"20180801"},{"dueDate":"20180831","processDate":"20180831"},{"dueDate":"20181001","processDate":"20181001"},{"dueDate":"20181101","processDate":"20181101"},{"dueDate":"20181130","processDate":"20181130"},{"dueDate":"20181231","processDate":"20181231"},{"dueDate":"20190201","processDate":"20190201"},{"dueDate":"20190301","processDate":"20190301"},{"dueDate":"20190401","processDate":"20190401"},{"dueDate":"20190501","processDate":"20190501"},{"dueDate":"20190531","processDate":"20190531"}]}
 
 */

class JMDateOption: NSObject {
    var dateOptions: [JMDate]?
    
    class JMDate: NSObject {
        var dueDate: String?
        var processDate: String?
        let value = ["dueDate": "dueDate",
                     "processDate": "processDate"]
    }
}

/*
 
 Date Preview call
 https://secure07a.chase.com/svc/rr/payments/secure/v1/transfer/account/repeating/preview/xfer/date/options/list
 
 * debitAccountOptionId: 649244560
 * creditAccountOptionId: 649244561
 * frequency: MONTHLY
 * numTransfers: 0
 * openEnded: true
 * dayOfMonth: ONE
 * earliestDueDate: 20180601
 
 */

class JMDatePreview: NSObject {
    var scheduledDates: [JMDate]?
    
    class JMDate: NSObject {
        var dueDate: String?
        var processDate: String?
        let value = ["dueDate": "dueDate",
                     "processDate": "processDate"]
    }
}
