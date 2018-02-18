//
//  Constants.swift
//  Weather
//
//  Created by Durgesh Lal Gupta on 2/22/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import Foundation
import UIKit

public typealias CompletionHandler = (_ success: Bool , _ data: Any? , _ error: Error?) -> Void

public struct Constants {
    static let estimatedRowHeight: CGFloat = 100
    static let baseURL: String = "https://itunes.apple.com/search?term="
}


//
//  ViewController.swift
//  WebApi
//
//  Created by Durgesh Lal Gupta on 2/17/18.
//  Copyright © 2018 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


class APIClass: NSObject {

    func cardAutopayEnable(_ payeeId: String) -> Void {
        let param = ["payeeId" : payeeId]
    }
    
    class JPPaymentCard: NSObject {
        
        public var label: String?
        public var payeeId: String?
        public var deleteFlag: Bool = false
        
        let parse = ["label" : "label",
                     "payeeId" : "payeeId",
                     "deleteFlag" : "deleteFlag"]
        
        public var displayLabel: String {
            return label ?? ""
        }
    }
    
    
    func fetchMerchantActivityList() -> Void {
        let param = ["sortBy" : "SEND_ON_DATE" , "sortOrder" : "DESC"]
    }
    
    class JPMerchantActivityList: NSObject {
        public var end: String?
        public var billPayPayeeType: String?
        public var hasMoreRecords: Bool = false
        public var payments: [JPMerchantActivityListItem]?
        
        let parse = ["end" : "end",
                     "billPayPayeeType" : "billPayPayeeType",
                     "hasMoreRecords" : "hasMoreRecords"]
    }
    
    class JPMerchantActivityListItem: NSObject {
        
        public var amount: String?
        public var payeeId: String?
        public var dueDate: String?
        public var paymentId: String?
        public var payeeLabel: String?
        public var processDate: String?
        public var payeeNickname: String?
        public var payeeAccountMask: String?
        
        public var updateAllowed: Bool = false
        public var cancelAllowed: Bool = false
        public var detailAllowed: Bool = false
        public var inquiryAllowed: Bool = false
        public var updateRepeatingAllowed: Bool = false
        // Change in ENUM
        public var frequency: String?
        public var paymentStatus: String?
        
        let parse = ["amount" : "amount",
                     "payeeId" : "payeeId",
                     "dueDate" : "dueDate",
                     "paymentId" : "paymentId",
                     "payeeLabel" : "payeeLabel",
                     "processDate" : "processDate",
                     "payeeNickname" : "payeeNickname",
                     "payeeAccountMask" : "payeeAccountMask",
                     "updateAllowed" : "updateAllowed",
                     "cancelAllowed" : "cancelAllowed",
                     "detailAllowed" : "detailAllowed",
                     "inquiryAllowed" : "inquiryAllowed",
                     "updateRepeatingAllowed" : "updateRepeatingAllowed"]
        
    }
    
    func fetchMerchantActivityListItemDetail(_ paymentId: String, dueDate: String) -> Void {
        let param = ["paymentId" : paymentId , "dueDate" : dueDate]
    }
    
    class JPMerchantActivityListItemDetail: NSObject {
        
        public var memo: String?
        public var dueDate: String?
        public var paymentId: String?
        public var approvedBy: String?
        public var submittedBy: String?
        public var lastModifiedBy: String?
        public var fundingAccountName: String?
       
        public var accessManager: Bool = false
        public var inquiryAllowed: Bool = false
        public var proofOfPaymentRequired: Bool = false
        
        // Change in ENUM
        public var paymentStatus: String?
        
        public var merchantPayeeRepeatingPayment: JPRepeatPaymentFrequency?
        
        let parse = ["memo" : "memo",
                     "dueDate" : "dueDate",
                     "paymentId" : "paymentId",
                     "approvedBy" : "approvedBy",
                     "submittedBy" : "submittedBy",
                     "lastModifiedBy" : "lastModifiedBy",
                     "fundingAccountName" : "fundingAccountName",
                     "accessManager" : "accessManager",
                     "inquiryAllowed" : "inquiryAllowed",
                     "proofOfPaymentRequired" : "proofOfPaymentRequired",
                     "paymentStatus" : "paymentStatus"]
    }
    
    class JPRepeatPaymentFrequency: NSObject {
        public var month: String?
        public var frequency: String?
        public var dayOfMonth: String?
        public var dayOfWeek: String?
        public var numberOfPayments: String?
        public var secondDayOfMonth: String?
        public var openEnded: Bool = false
        
        let parse = ["month" : "month",
                     "dayOfWeek": "dayOfWeek",
                     "openEnded" : "openEnded",
                     "frequency" : "frequency",
                     "dayOfMonth" : "dayOfMonth",
                     "numberOfPayments" : "numberOfPayments",
                     "secondDayOfMonth" : "secondDayOfMonth"]
        
        func frequncyParameters() -> [String : Any] {
            guard let frequency = frequency else { return [:] }
            var param: [String : Any] = [:]
            
            switch frequency{
            case "WEEKLY":
                param =  ["frequency" : "WEEKLY", "dayOfWeek" : dayOfWeek ?? ""]
            case "BIWEEKLY":
                param =  ["frequency" : "BIWEEKLY", "dayOfWeek" : dayOfWeek ?? ""]
            case "TWICE_MONTHLY":
                param =  ["frequency" : "TWICE_MONTHLY", "dayOfMonth" : dayOfMonth ?? "", "secondDayOfMonth" : secondDayOfMonth ?? ""]
            case "FOUR_WEEKS":
                param =  ["frequency" : "FOUR_WEEKS", "dayOfWeek" : dayOfWeek ?? ""]
            case "MONTHLY":
                param =  ["frequency" : "MONTHLY", "dayOfMonth" : dayOfMonth ?? ""]
            case "BIMONTHLY":
                param =  ["frequency" : "BIMONTHLY", "dayOfMonth" : dayOfMonth ?? ""]
            case "QUARTERLY":
                param =  ["frequency" : "QUARTERLY", "dayOfMonth" : dayOfMonth ?? ""]
            case "SEMI_ANNUALLY":
                param =  ["frequency" : "SEMI_ANNUALLY", "dayOfMonth" : dayOfMonth ?? ""]
            case "YEARLY":
                param =  ["frequency" : "YEARLY", "dayOfMonth" : dayOfMonth ?? "", "month" : month ?? ""]
            default:
               param =  [:]
            }
            if openEnded {
                param["openEnded"] = true
            } else {
                param["openEnded"] = false
                param["numberOfPayments"] = numberOfPayments
            }
            return param
        }
        
        
        func displayFrequency() -> String {
            return frequency ?? ""
        }
        
        func displaySendNotification() -> String {
            guard let frequency = frequency else { return "" }
            
            switch frequency{
            case "WEEKLY":
                return "\(dayOfWeek ?? "") of each week"
            case "BIWEEKLY":
                return "\(dayOfWeek ?? "") of every other week"
            case "TWICE_MONTHLY":
                return "The \(dayOfMonth ?? "") and \(secondDayOfMonth ?? "") day of each week"
            case "FOUR_WEEKS":
                return "\(dayOfWeek ?? "") of every 4th week"
            case "MONTHLY":
                return "\(dayOfMonth ?? "") day of each month"
            case "BIMONTHLY":
                return "The \(dayOfMonth ?? "") day of each month, every other nonth"
            case "QUARTERLY":
                return "The \(dayOfMonth ?? "") day of each month, every three nonth"
            case "SEMI_ANNUALLY":
                return "\(dayOfMonth ?? "") day of each month, every six nonth"
            case "YEARLY":
                return "\(month ?? "") \(dayOfMonth ?? "") each year"
            default:
                return ""
            }
        }
    }
    
    
    
    // Same for Edit: Single/ Series, Cancel: Single/ Series On click Edit of Cancel Button (Before Presendting Action Sheet)
    func updatePaymentOption(_ paymentId: String) -> Void {
        let param = ["paymentId" : paymentId]
    }
    
    class JPUpdatePaymentOption: NSObject {
        public var paymentId: String?
        public var repeatingModelId: String?
        
        let parse = ["paymentId" : "paymentId",
                     "repeatingModelId" : "repeatingModelId"]
    }
    
    // Same for Single and Next Payment Edit Invoke
    func editSinglePaymentInvoke(_ paymentId: String) -> Void {
        let param = ["paymentId" : paymentId]
    }
    
    // To be used in Single Edit, Next Payment Edit and Series Set up
    class JPPaymentOption: NSObject {
        
        public var memo: String?
        public var amount: String?
        public var dueDate: String?
        public var payeeId: String?
        public var optionId: String?
        public var payeeName: String?
        public var paymentId: String?
        public var payeeLabel: String?
        public var cutOffTime: String?
        public var processDate: String?
        public var updateToken: String?
        public var payeeLeadTime: String?
        public var fundingAccountId: String?
        public var invalidFundingAccountLabel: String?
       
        public var eBillPayee: Bool = false
        public var paperCheckFlag: Bool = false
        public var replacementBill: Bool = false
        public var updateEBillAllowed: Bool = false
        public var grandFatherPayeeFlag: Bool = false
        
        public var fundingAccounts: [JPPaymentAccount]?
        public var dateOptions: [JPUpdatePaymentDateOption]?
        
        let parse = ["memo" : "memo",
                     "amount" : "amount",
                     "dueDate" : "dueDate",
                     "payeeId" : "payeeId",
                     "optionId" : "optionId",
                     "payeeName" : "payeeName",
                     "paymentId" : "paymentId",
                     "payeeLabel" : "payeeLabel",
                     "cutOffTime" : "cutOffTime",
                     "processDate" : "processDate",
                     "updateToken" : "updateToken",
                     "payeeLeadTime" : "payeeLeadTime",
                     "fundingAccountId" : "fundingAccountId",
                     "invalidFundingAccountLabel" : "invalidFundingAccountLabel",
                     "eBillPayee" : "eBillPayee",
                     "paperCheckFlag" : "paperCheckFlag",
                     "replacementBill" : "replacementBill",
                     "updateEBillAllowed" : "updateEBillAllowed",
                     "grandFatherPayeeFlag" : "grandFatherPayeeFlag"]
       
    }
    
    @objc public class JPUpdatePaymentDateOption: NSObject {
        public var dueDate: String?
        public var paymentDate: String?
        public var processDate: String?
       
        let parse = ["dueDate" : "dueDate",
                     "processDate" : "processDate",
                     "paymentDate" : "paymentDate"]
    }
    
    @objc public class JPPaymentAccount: NSObject {
        
        public var id: String?
        public var label: String?
        public var accountId: String?
        public var accountName: String?
        public var availableBalance: String?
        
        public var defaultFlag: Bool = false
        public var defaultAccount: Bool = false
        
        let parse = ["id" : "id",
                     "label" : "label",
                     "accountId" : "accountId",
                     "accountName" : "accountName",
                     "defaultFlag" : "defaultFlag",
                     "defaultAccount" : "defaultAccount",
                     "availableBalance" : "availableBalance"]
        
    }
    
    // Same for Single and Next Payment Edit Invoke
    func editSinglePaymentValidate(_ paymentId: String, amount: String,  dueDate: String, fundingAccountId: String, optionId: String, memo: String?) -> Void {
        let param = ["paymentId" : paymentId,
                     "amount" : amount,
                     "dueDate" : dueDate,
                     "fundingAccountId" : fundingAccountId,
                     "optionId" : optionId,
                     "memo" : memo]
    }
    
    // Same for Single and Next Payment Edit Confrim
    func editSinglePaymentConfirm(_ formId: String, updateToken: String) -> Void {
        let param = ["formId" : formId,
                     "updateToken" : updateToken]
    }
   
    // Model to be used in Edit Single Validate and confirm
    class JPSinglePayment: NSObject {
        
        public var memo: String?
        public var status: String?
        public var formId: String?
        public var amount: String?
        public var dueDate: String?
        public var payeeName: String?
        public var paymentId: String?
        public var processDate: String?
        public var accountName: String?
        public var fundingAccountName: String?
        
        public var eBillPayee: Bool = false
        public var cancelAllowed: Bool = false
        public var updateAllowed: Bool = false
        public var inquiryAllowed: Bool = false
        public var addQuickPayAllowed: Bool = false
        public var addEBillPayeeAllowed: Bool = false
 
        
        let parse = ["formId" : "formId",
                     "amount" : "amount",
                     "dueDate" : "dueDate",
                     "processDate" : "processDate",
                     "accountName" : "accountName",
                     "memo" : "memo",
                     "payeeName" : "payeeName",
                     "eBillPayee" : "eBillPayee",
                     "addEBillPayeeAllowed" : "addEBillPayeeAllowed",
                     "addQuickPayAllowed" : "addQuickPayAllowed",
                     "inquiryAllowed" : "inquiryAllowed",
                     "cancelAllowed" : "cancelAllowed",
                     "updateAllowed" :  "updateAllowed",
                     "status" : "status",
                     "paymentId" : "paymentId",
                     "fundingAccountName" : "fundingAccountName"]
        
    }
    
    
    
    func editRepeatPaymentInvoke(_ repeatingModelId: String) -> Void {
        let param = ["repeatingModelId" : repeatingModelId]
    }
    
    class JPEditSeriesPaymentOption: NSObject {
        
        public var payeeId: String?
        public var payeeName: String?
        public var payeeLabel: String?
        public var payeeLeadTime: String?
        public var repeatingModelId: String?
        public var repeatingModelToken: String?
        
        public var paperCheckFlag: Bool = false
        
        public var fundingAccounts: [JPPaymentAccount]?
        public var details: JPRepeatPaymentDetail?
        public var subFrequencyMappings: JPRepeatPaymentSubFrequencyMappings?
        public var subFrequencyOptions: JPRepeatPaymentSubFrequencyOptions?
      
        public var frequencyList: [String]?
        public var defaultFrequencyValue: String?
        
        public var dateOptions: [JPUpdatePaymentDateOption]?
        
        let parse = ["payeeId" : "payeeId",
                     "payeeName" : "payeeName",
                     "payeeLabel" : "payeeLabel",
                     "payeeLeadTime" : "payeeLeadTime",
                     "paperCheckFlag" : "paperCheckFlag",
                     "repeatingModelId" : "repeatingModelId",
                     "repeatingModelToken" : "repeatingModelToken",
                     "defaultFrequencyValue" : "defaultFrequencyValue"]
        
    }
    
    
    @objc public class JPRepeatPaymentDetail: NSObject {
        
        public var memo: String?
        public var amount: String?
        public var earliestDueDate: String?
        public var fundingAccountId: String?
        public var model: JPRepeatPaymentFrequency?
        
        let parse = ["memo" : "memo",
                     "amount" : "amount",
                     "earliestDueDate" : "earliestDueDate",
                     "fundingAccountId" : "fundingAccountId"]
        
    }
    
    @objc public class JPRepeatPaymentSubFrequencyMappings: NSObject {
        
        public var mapping: String?
        public var defaultMonth: String?
        public var defaultFromDay: String?
        
        let parse = ["mapping" : "mapping",
                     "defaultMonth" : "defaultMonth",
                     "defaultFromDay" : "defaultFromDay"]
        
    }
    
    @objc public class JPRepeatPaymentSubFrequencyOptions: NSObject {
        public var month: [String]?
        public var day: [String]?
    }
    
    func editRepeatPaymentValidate(_ frequency: JPRepeatPaymentFrequency, repeatingModelId: String, amount: String, earliestPaymentDate: String, fundingAccountId: String, memo: String?) -> Void {
        var param = frequency.frequncyParameters()
        param["repeatingModelId"] = repeatingModelId
        param["amount"] = amount
        param["earliestPaymentDate"] = earliestPaymentDate
        param["fundingAccountId"] = fundingAccountId
        param["memo"] = memo
    }
    
    // Model to be used in Edit Single Validate and confirm, Series setup validate and confirm
    class JPRepeatPayment: NSObject {
        
        public var memo: String?
        public var formId: String?
        public var amount: String?
        public var payeeName: String?
        public var payeeLabel: String?
        public var firstPaymentDate: String?
        public var fundingAccountName: String?
        public var scheduledPaymentId: String?
        public var scheduledPaymentStatus: String?
        public var scheduledPaymentDueDate: String?

        public var cancelAllowed: Bool = false
        public var updateAllowed: Bool = false
        public var inquiryAllowed: Bool = false
        
        public var model: JPRepeatPaymentFrequency?
        public var scheduledDates: [JPUpdatePaymentDateOption]?
        
        let parse = ["formId" : "formId",
                     "payeeName" : "payeeName",
                     "payeeLabel" : "payeeLabel",
                     "amount" : "amount",
                     "fundingAccountName" : "fundingAccountName",
                     "memo" : "memo",
                     "firstPaymentDate": "firstPaymentDate",
                     "inquiryAllowed": "inquiryAllowed",
                     "cancelAllowed": "cancelAllowed",
                     "updateAllowed": "updateAllowed",
                     "scheduledPaymentStatus": "scheduledPaymentStatus",
                     "scheduledPaymentId": "scheduledPaymentId",
                     "scheduledPaymentStatus": "scheduledPaymentStatus"]
        
    }
    
    func editRepeatPaymentConfirm(_ formId: String, repeatingModelToken: String) -> Void {
        let param = ["formId" : formId , "repeatingModelToken" : repeatingModelToken]
       
    }
    
    enum CancelPaymentType {
        case Single
        case NextPayment
        case EntireSeries
    }
    
    func cancelPaymentInvoke(_ paymentType: CancelPaymentType, paymentId: String) -> Void {
        var param: [String : Any] = [:]
        
        switch paymentType {
        case .Single:
            param = ["paymentId" : paymentId]
        case .NextPayment:
            param = ["paymentId" : paymentId, "cancelSeries" : false]
        case .EntireSeries:
            param = ["paymentId" : paymentId, "cancelSeries" : true]
        }
        
    }

    
    class JPCancelPayment: NSObject {
        
        public var amount: String?
        public var paymentId: String?
        public var payeeNickname: String?
        public var cancellationToken: String?
        public var paymentProcessDate: String?
        public var payeeLabel: String?
        
        public var inquiryAllowed: Bool = false
        public var cancelAllowed: Bool = false
        public var updateAllowed: Bool = false
        
        let parse = ["amount" : "amount",
                     "paymentId" : "paymentId",
                     "payeeNickname" : "payeeNickname",
                     "cancellationToken" : "cancellationToken",
                     "paymentProcessDate" : "paymentProcessDate",
                     "payeeLabel" : "payeeLabel",
                     "inquiryAllowed" : "inquiryAllowed",
                     "cancelAllowed" : "cancelAllowed",
                     "updateAllowed" : "updateAllowed"]
        
    }
    
    // Pass repeatingModelId & repeatingModelToken = nil for Single and Next Payment and paymentId & cancellationToken = nil for Series
    func cancelPaymentConfirm(_ paymentType: CancelPaymentType, paymentId: String?, cancellationToken: String?, repeatingModelId: String?, repeatingModelToken: String?, memo: String?) -> Void {
        
        var param: [String : Any] = [:]
        
        switch paymentType {
        case .Single, .NextPayment:
            param = ["paymentId" : paymentId, "cancellationToken": cancellationToken, "memo" : memo]
        case .EntireSeries:
            param = ["repeatingModelId" : repeatingModelId, "repeatingModelToken" : repeatingModelToken]
        }
        
    }
    
    // Pass repeatingModelId & repeatingModelToken = nil for Single and Next Payment and paymentId & cancellationToken = nil for Series
    func optionRepeatPayment(_ payeeId: String) -> Void {
        let param = ["payeeId" : payeeId]
        // Use JPPaymentOption for parsing
    }
    
    func repeatPaymentDateOption(_ frequency: JPRepeatPaymentFrequency, payeeId: String, fundingAccountId: String, earliestPaymentDate: String) -> Void {
        var param = frequency.frequncyParameters()
        param["payeeId"] = payeeId
        param["fundingAccountId"] = fundingAccountId
        param["earliestPaymentDate"] = earliestPaymentDate
    }
    
    class JPRepeatPaymentDateOption: NSObject {
        
        public var subFrequencyMappings: JPRepeatPaymentSubFrequencyMappings?
        public var subFrequencyOptions: JPRepeatPaymentSubFrequencyOptions?
        public var dateOptions: [JPUpdatePaymentDateOption]?
    }
        
    
    func validateRepeatPayment(_ frequency: JPRepeatPaymentFrequency, payeeId: String, fundingAccountId: String, amount: String, earliestPaymentDate: String, memo: String?) -> Void {
        var param = frequency.frequncyParameters()
        param["payeeId"] = payeeId
        param["amount"] = amount
        param["memo"] = memo
        param["fundingAccountId"] = fundingAccountId
        param["earliestPaymentDate"] = earliestPaymentDate
        
        // For parsing: JPRepeatPayment
    }
    
    func confirmRepeatPayment(_ formId: String) -> Void {
        var param = ["formId" : formId]
        // For parsing: JPRepeatPayment
    }
}







Card Payment Activity List

Check Autopay

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/card/autopaystatus/list
payeeId:-513729664

{"code":"SUCCESS","activated":false}


Activity List/ Activity Detail

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/card/payment/list
payeeId:-513729664

{"code":"SUCCESS","paymentActivities":[{"paymentId":-15,"amount":16.71,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20180207","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3444924221","description":"Other"},{"paymentId":-14,"amount":2450.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20180112","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3410156872","description":"Other"},{"paymentId":-13,"amount":2500.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20180110","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3406645619","description":"Other"},{"paymentId":-12,"amount":50.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20171209","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3363202052","description":"Other"},{"paymentId":-11,"amount":1000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20171106","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3316308083","description":"Other"},{"paymentId":-10,"amount":2000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20171017","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3290099942","description":"Other"},{"paymentId":-9,"amount":2000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20171013","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3286056159","description":"Other"},{"paymentId":-8,"amount":2000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20171003","activityStatus":"COMPLETED","fundingAccountName":"Bank of America, National Association (...5728)","confirmationNumber":"3270782787","description":"Other"},{"paymentId":-7,"amount":1000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170908","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3237069619","description":"Other"},{"paymentId":-6,"amount":1000.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170806","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3194015295","description":"Other"},{"paymentId":-5,"amount":500.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170708","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3155222931","description":"Other"},{"paymentId":-4,"amount":444.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170606","activityStatus":"COMPLETED","fundingAccountName":"Bank of America, National Association (...5728)","confirmationNumber":"3112896858","description":"Other"},{"paymentId":-3,"amount":200.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170508","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3074557995","description":"Other"},{"paymentId":-2,"amount":152.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170407","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"3033684461","description":"Other"},{"paymentId":-1,"amount":154.00,"cancelAllowed":false,"updateAllowed":false,"inquiryAllowed":true,"dueDate":"20170307","activityStatus":"COMPLETED","fundingAccountName":"TOTAL CHECKING (...8718)","confirmationNumber":"2993111264","description":"Other"}],"cardPayees":[{"payeeId":-513729664,"label":"CREDIT CARD (...0048)","deleteFlag":false},{"payeeId":-612474798,"label":"CREDIT CARD (...2070)","deleteFlag":false}],"defaultPayeeId":-513729664,"autoPayment":false}


Merchant Activity List

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchant/payment/activity/list
* sortBy:SEND_ON_DATE
* sortOrder:DESC

{"code":"SUCCESS","payments":[{"paymentId":6911536506,"amount":0.01,"payeeId":1061562325,"payeeName":"Test","payeeNickname":"Test","payeeAccountMask":"6829","payeeLabel":"...6829","dueDate":"20200103","processDate":"20191226","inquiryAllowed":false,"cancelAllowed":true,"detailAllowed":true,"updateAllowed":true,"updateRepeatingAllowed":true,"paymentStatus":"PENDING","frequency":"YEARLY"},{"paymentId":6911533065,"amount":0.01,"payeeId":1061562325,"payeeName":"Test","payeeNickname":"Test","payeeAccountMask":"6829","payeeLabel":"...6829","processDate":"20181227","inquiryAllowed":false,"cancelAllowed":false,"detailAllowed":true,"updateAllowed":false,"updateRepeatingAllowed":false,"paymentStatus":"CANCELED","frequency":"YEARLY"},{"paymentId":6910512298,"amount":0.01,"payeeId":1067978207,"payeeName":"Dummy payee","payeeNickname":"DummyLink","payeeAccountMask":"5623","payeeLabel":"Dummy payee...5623","dueDate":"20180315","processDate":"20180308","inquiryAllowed":false,"cancelAllowed":true,"detailAllowed":true,"updateAllowed":true,"updateRepeatingAllowed":false,"paymentStatus":"PENDING","frequency":"ONE_TIME"}],"hasMoreRecords":false,"end":"3","billPayPayeeType":"MERCHANT"}


Merchant Activity Detail

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/payee/merchant/detail/list
* paymentId:6911536506
* dueDate:20200103

{"code":"SUCCESS","paymentStatus":"PENDING","dueDate":"20200103","merchantPayeeRepeatingPayment":{"frequency":"YEARLY","dayOfMonth":"FOUR","month":"JAN"},"fundingAccountName":"FINN CHECKING (...5896)","memo":"Repeat bill pay for testing","submittedBy":"Not Available","lastModifiedBy":"Not Available","approvedBy":"Not Available","inquiryAllowed":false,"proofOfPaymentRequired":false,"paymentId":6911536506,"accessManager":false}

Edit Single

Invoke

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/list
paymentId:6910512298

{"code":"SUCCESS","paymentId":6910512298,"cutOffTime":"8 PM ET","payeeLeadTime":"FIVE_BUSINESS_DAYS_PAPER_CHECK","amount":0.01,"dueDate":"20180315","fundingAccountId":649244560,"optionId":0,"processDate":"20180308","dateOptions":[{"dueDate":"20180227","processDate":"20180220"},{"dueDate":"20180228","processDate":"20180221"},{"dueDate":"20180301","processDate":"20180222"},{"dueDate":"20180302","processDate":"20180223"},{"dueDate":"20190207","processDate":"20190131"},{"dueDate":"20190208","processDate":"20190201"},{"dueDate":"20190211","processDate":"20190204"},{"dueDate":"20190212","processDate":"20190205"},{"dueDate":"20190213","processDate":"20190206"},{"dueDate":"20190214","processDate":"20190207"},{"dueDate":"20190215","processDate":"20190208"}],"fundingAccounts":[{"accountId":649244560,"accountName":"FINN CHECKING (...5896)","defaultAccount":true,"availableBalance":73.60},{"accountId":598398010,"accountName":"TOTAL CHECKING (...8718)","defaultAccount":false,"availableBalance":4237.37}],"invalidFundingAccountLabel":"","payeeId":1067978207,"payeeName":"DummyLink","payeeLabel":"Dummy payee...5623","updateToken":1518813636000,"eBillPayee":false,"replacementBill":false,"updateEBillAllowed":false,"paperCheckFlag":true}

Validate

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/validate
* paymentId:6910512298
* amount:0.01
* dueDate:20180315
* fundingAccountId:649244560
* memo:Cancel single
* optionId:0

{"code":"SUCCESS","formId":"upDPWgBUeB","amount":0.01,"dueDate":"20180315","processDate":"20180308","accountName":"FINN CHECKING (...5896)","memo":"Cancel single ","payeeName":"DummyLink","eBillPayee":false}

Confirm

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchantpayment/update
* formId:upDPWgBUeB
* updateToken:1518813636000

{"code":"SUCCESS","paymentId":6910512298,"amount":0.01,"dueDate":"20180315","processDate":"20180308","fundingAccountName":"FINN CHECKING (...5896)","memo":"Cancel single ","payeeName":"DummyLink","eBillPayee":false,"addEBillPayeeAllowed":false,"addQuickPayAllowed":true,"status":"PENDING","inquiryAllowed":false,"cancelAllowed":true,"updateAllowed":true}



Edit Next Payment in Series

Option call (Click Edit/Cancel Button on Payment Scheduled Detail page)

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/type/options
paymentId:6911536506

{"code":"SUCCESS","paymentId":6911536506,"repeatingModelId":6911533059}

// Choose Next Payment Edit
Invoke

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/list
paymentId:6911536506

{"code":"SUCCESS","paymentId":6911536506,"cutOffTime":"8 PM ET","payeeLeadTime":"FIVE_BUSINESS_DAYS_PAPER_CHECK","amount":0.01,"dueDate":"20200103","fundingAccountId":649244560,"memo":"Repeat bill pay for testing","optionId":0,"processDate":"20191226","dateOptions":[{"dueDate":"20180227","processDate":"20180220"},{"dueDate":"20180228","processDate":"20180221"},{"dueDate":"20180301","processDate":"20180222"},{"dueDate":"20201229","processDate":"20201221"},{"dueDate":"20201230","processDate":"20201222"},{"dueDate":"20201231","processDate":"20201223"},{"dueDate":"20210101","processDate":"20201224"}],"fundingAccounts":[{"accountId":649244560,"accountName":"FINN CHECKING (...5896)","defaultAccount":true,"availableBalance":73.60},{"accountId":598398010,"accountName":"TOTAL CHECKING (...8718)","defaultAccount":false,"availableBalance":4237.37}],"invalidFundingAccountLabel":"","payeeId":1061562325,"payeeName":"Test","payeeLabel":"...6829","updateToken":1518840143000,"eBillPayee":false,"replacementBill":false,"updateEBillAllowed":false,"paperCheckFlag":true}

Validate:
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/validate
* paymentId:6911536506
* amount:0.01
* dueDate:20200103
* fundingAccountId:649244560
* memo:Repeat bill pay for testing
    * optionId:0

{"code":"SUCCESS","formId":"vAqtXNLocY","amount":0.01,"dueDate":"20200103","processDate":"20191226","accountName":"FINN CHECKING (...5896)","memo":"Repeat bill pay for testing","payeeName":"Test","eBillPayee":false}

Confirm:

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchantpayment/update
* formId:vAqtXNLocY
* updateToken:1518840143000

{"code":"SUCCESS","paymentId":6911536506,"amount":0.01,"dueDate":"20200103","processDate":"20191226","fundingAccountName":"FINN CHECKING (...5896)","memo":"Repeat bill pay for testing","payeeName":"Test","eBillPayee":false,"addEBillPayeeAllowed":false,"addQuickPayAllowed":true,"status":"PENDING","inquiryAllowed":false,"cancelAllowed":true,"updateAllowed":true}

Edit Series, all payment

Option call

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/type/options
paymentId:6911536506

{"code":"SUCCESS","paymentId":6911536506,"repeatingModelId":6911533059}


Select Edit All Payment Edit
Invoke call

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchant/repeatingpayment/update/options/list
repeatingModelId:6911533059


{"code":"SUCCESS","payeeId":1061562325,"payeeLabel":"...6829","payeeName":"Test","fundingAccounts":[{"availableBalance":73.60,"defaultFlag":true,"accountId":649244560,"label":"FINN CHECKING (...5896)"},{"availableBalance":4237.37,"defaultFlag":false,"accountId":598398010,"label":"TOTAL CHECKING (...8718)"}],"payeeLeadTime":"FIVE_BUSINESS_DAYS_PAPER_CHECK","paperCheckFlag":true,"repeatingModelId":6911533059,"repeatingModelToken":1518840143000,"details":{"amount":0.01,"fundingAccountId":649244560,"model":{"dayOfMonth":"FOUR","frequency":"YEARLY","month":"JAN","numberOfPayments":-1,"openEnded":true},"memo":"Repeat bill pay for testing","earliestDueDate":"20200103"},"frequencyList":["WEEKLY","BIWEEKLY","TWICE_MONTHLY","FOUR_WEEKS","MONTHLY","BIMONTHLY","QUARTERLY","SEMI_ANNUALLY","YEARLY"],"defaultFrequencyValue":"YEARLY","subFrequencyMappings":[{"mapping":"MONTH","defaultMonth":"JAN"},{"mapping":"DAY","defaultFromDay":"FOUR"}],"subFrequencyOptions":{"month":["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],"day":["ONE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT","NINE","TEN","ELEVEN","TWELVE","THIRTEEN","FOURTEEN","FIFTEEN","SIXTEEN","SEVENTEEN","EIGHTEEN","NINETEEN","TWENTY","TWENTYONE","TWENTYTWO","TWENTYTHREE","TWENTYFOUR","TWENTYFIVE","TWENTYSIX","TWENTYSEVEN","TWENTYEIGHT","TWENTYNINE","THIRTY","LAST"]},"dateOptions":[{"paymentDate":"20190104","processDate":"20181227"}]}


Validate call

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchant/repeatingpayment/update/validate
* repeatingModelId:6911533059
* amount:0.01
* earliestPaymentDate:20190104
* fundingAccountId:649244560
* frequency:YEARLY
* month:JAN
* dayOfMonth:FOUR
* openEnded:true
* memo:Repeat bill pay for testing
    
    {"code":"SUCCESS","formId":"gpqJGkBGvN","payeeName":"Test","payeeLabel":"...6829","amount":0.01,"fundingAccountName":"FINN CHECKING (...5896)","memo":"Repeat bill pay for testing","model":{"dayOfMonth":"FOUR","frequency":"YEARLY","month":"JAN","numberOfPayments":0,"openEnded":true},"scheduledDates":[{"paymentDate":"20190104","processDate":"20181227"},{"paymentDate":"20200103","processDate":"20191226"},{"paymentDate":"20210104","processDate":"20201228"},{"paymentDate":"20220104","processDate":"20211228"},{"paymentDate":"20230104","processDate":"20221228"},{"paymentDate":"20240104","processDate":"20231228"}],"firstPaymentDate":"20190104"}
    
    Confirm call:

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchant/repeatingpayment/update
* formId:gpqJGkBGvN
* repeatingModelToken:1518840143000

{"code":"SUCCESS","payeeName":"Test","payeeLabel":"...6829","amount":0.01,"fundingAccountName":"FINN CHECKING (...5896)","memo":"Repeat bill pay for testing","model":{"dayOfMonth":"FOUR","frequency":"YEARLY","month":"JAN","numberOfPayments":-1,"openEnded":true},"scheduledPaymentDueDate":"20190104","scheduledPaymentId":6911536506,"scheduledPaymentStatus":"PENDING","inquiryAllowed":false,"cancelAllowed":true,"updateAllowed":true}

Cancel Single

Invoke

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/cancel/list
paymentId:6910512298

{"code":"SUCCESS","amount":0.01,"paymentId":6910512298,"cancellationToken":1518843569000,"paymentProcessDate":"20180315","payeeLabel":"DummyLink"}

Confirm

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchantpayment/cancel
* paymentId:6910512298
* cancellationToken:1518843569000
* memo:Cancel it

{"code":"SUCCESS","amount":0.01,"payeeNickname":"DummyLink","paymentProcessDate":"20180315","inquiryAllowed":false,"cancelAllowed":false,"updateAllowed":false}



Cancel Single Next Payment

Option call:

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/type/options
paymentId:6911536506

{"code":"SUCCESS","paymentId":6911536506,"repeatingModelId":6911533059}

Invoke call

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/cancel/list
* paymentId:6911536506
* cancelSeries:false

{"code":"SUCCESS","amount":0.01,"paymentId":6911536506,"cancellationToken":1518843056000,"paymentProcessDate":"20190104","payeeLabel":"Test"}

Confirm
https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchantpayment/cancel
* paymentId:6911536506
* cancellationToken:1518843056000
* memo:Cancel Next payment from a Series

{"code":"SUCCESS","amount":0.01,"payeeNickname":"Test","paymentProcessDate":"20190104","inquiryAllowed":false,"cancelAllowed":false,"updateAllowed":false}

Cancel Series

Option call:

https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/update/type/options
paymentId:6911536506

{"code":"SUCCESS","paymentId":6911536506,"repeatingModelId":6911533059}


Invoke
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpayment/cancel/list
* paymentId:6911533059
* cancelSeries:true

{"code":"SUCCESS","amount":0.01,"repeatingModelId":6911533059,"repeatingModelToken":1518843262000,"payeeLabel":"Test"}

Confirm

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchantpayment/cancel
* repeatingModelId:6911533059
* repeatingModelToken:1518843262000

{"code":"SUCCESS","amount":0.01,"payeeNickname":"Test","inquiryAllowed":false,"cancelAllowed":false,"updateAllowed":false}







Set Up Repeat Payment

Option Call
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchantpaymentoptions/list
payeeId:1067978207

{"code":"SUCCESS","payeeId":1067978207,"payeeName":"DummyLink","payeeLabel":"Dummy payee...5623","dateOptions":[{"dueDate":"20180227","processDate":"20180220"},{"dueDate":"20180228","processDate":"20180221"},{"dueDate":"20180301","processDate":"20180222"},{"dueDate":"20190211","processDate":"20190204"},{"dueDate":"20190212","processDate":"20190205"},{"dueDate":"20190213","processDate":"20190206"},{"dueDate":"20190214","processDate":"20190207"},{"dueDate":"20190215","processDate":"20190208"}],"fundingAccounts":[{"id":649244560,"label":"FINN CHECKING (...5896)","defaultAccount":true,"availableBalance":73.60},{"id":598398010,"label":"TOTAL CHECKING (...8718)","defaultAccount":false,"availableBalance":4237.37}],"cutoffTime":"8 PM ET","payeeLeadTime":"FIVE_BUSINESS_DAYS_PAPER_CHECK","paperCheckFlag":true,"grandFatherPayeeFlag":false}

Date Option Call
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchant/repeatingpayment/date/options/list
* payeeId:1067978207
* fundingAccountId:0
* numberOfPayments:0
* openEnded:true

{"code":"SUCCESS","frequencyList":["WEEKLY","BIWEEKLY","TWICE_MONTHLY","FOUR_WEEKS","MONTHLY","BIMONTHLY","QUARTERLY","SEMI_ANNUALLY","YEARLY"],"defaultFrequencyValue":"MONTHLY","subFrequencyMappings":[{"mapping":"DAY","defaultFromDay":"ONE"}],"subFrequencyOptions":{"day":["ONE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT","NINE","TEN","ELEVEN","TWELVE","THIRTEEN","FOURTEEN","FIFTEEN","SIXTEEN","SEVENTEEN","EIGHTEEN","NINETEEN","TWENTY","TWENTYONE","TWENTYTWO","TWENTYTHREE","TWENTYFOUR","TWENTYFIVE","TWENTYSIX","TWENTYSEVEN","TWENTYEIGHT","TWENTYNINE","THIRTY","LAST"]},"dateOptions":[{"paymentDate":"20180301","processDate":"20180222"},{"paymentDate":"20180330","processDate":"20180323"},{"paymentDate":"20180501","processDate":"20180424"},{"paymentDate":"20180601","processDate":"20180524"},{"paymentDate":"20180629","processDate":"20180622"},{"paymentDate":"20180801","processDate":"20180725"},{"paymentDate":"20180831","processDate":"20180824"},{"paymentDate":"20181001","processDate":"20180924"},{"paymentDate":"20181101","processDate":"20181025"},{"paymentDate":"20181130","processDate":"20181123"},{"paymentDate":"20181231","processDate":"20181221"},{"paymentDate":"20190201","processDate":"20190125"},{"paymentDate":"20190301","processDate":"20190222"}]}


Twice Per Month
    
    * payeeId:1067978207
* fundingAccountId:649244560
* frequency:TWICE_MONTHLY
* numberOfPayments:0
* openEnded:true
* dayOfMonth:ONE
* secondDayOfMonth:TWENTYONE


* payeeId:1067978207
* fundingAccountId:649244560
* frequency:TWICE_MONTHLY
* numberOfPayments:10
* openEnded:false
* earliestPaymentDate:20180301
* dayOfMonth:ONE
* secondDayOfMonth:TWENTYONE



{"code":"SUCCESS","subFrequencyMappings":[{"mapping":"DAY","defaultFromDay":"ONE"},{"mapping":"DAY","defaultToDay":"FIFTEEN"}],"subFrequencyOptions":{"day":["ONE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT","NINE","TEN","ELEVEN","TWELVE","THIRTEEN","FOURTEEN","FIFTEEN","SIXTEEN","SEVENTEEN","EIGHTEEN","NINETEEN","TWENTY","TWENTYONE","TWENTYTWO","TWENTYTHREE","TWENTYFOUR","TWENTYFIVE","TWENTYSIX","TWENTYSEVEN","TWENTYEIGHT","TWENTYNINE","THIRTY","LAST"]},"dateOptions":[{"paymentDate":"20180301","processDate":"20180222"},{"paymentDate":"20180315","processDate":"20180308"},{"paymentDate":"20180330","processDate":"20180323"},{"paymentDate":"20180413","processDate":"20180406"},{"paymentDate":"20180501","processDate":"20180424"},{"paymentDate":"20180515","processDate":"20180508"},{"paymentDate":"20180601","processDate":"20180524"},{"paymentDate":"20180615","processDate":"20180608"},{"paymentDate":"20180629","processDate":"20180622"},{"paymentDate":"20180713","processDate":"20180706"},{"paymentDate":"20180801","processDate":"20180725"},{"paymentDate":"20180815","processDate":"20180808"},{"paymentDate":"20180831","processDate":"20180824"},{"paymentDate":"20180914","processDate":"20180907"},{"paymentDate":"20181001","processDate":"20180924"},{"paymentDate":"20181015","processDate":"20181005"},{"paymentDate":"20181101","processDate":"20181025"},{"paymentDate":"20181115","processDate":"20181107"},{"paymentDate":"20181130","processDate":"20181123"},{"paymentDate":"20181214","processDate":"20181207"},{"paymentDate":"20181231","processDate":"20181221"},{"paymentDate":"20190115","processDate":"20190108"},{"paymentDate":"20190201","processDate":"20190125"},{"paymentDate":"20190215","processDate":"20190208"},{"paymentDate":"20190301","processDate":"20190222"},{"paymentDate":"20190315","processDate":"20190308"}]}


Yearly
    
    * payeeId:1067978207
* fundingAccountId:649244560
* frequency:YEARLY
* numberOfPayments:0
* openEnded:true


{"code":"SUCCESS","subFrequencyMappings":[{"mapping":"MONTH","defaultMonth":"JAN"},{"mapping":"DAY","defaultFromDay":"TWO"}],"subFrequencyOptions":{"month":["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],"day":["ONE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT","NINE","TEN","ELEVEN","TWELVE","THIRTEEN","FOURTEEN","FIFTEEN","SIXTEEN","SEVENTEEN","EIGHTEEN","NINETEEN","TWENTY","TWENTYONE","TWENTYTWO","TWENTYTHREE","TWENTYFOUR","TWENTYFIVE","TWENTYSIX","TWENTYSEVEN","TWENTYEIGHT","TWENTYNINE","THIRTY","LAST"]},"dateOptions":[{"paymentDate":"20190102","processDate":"20181224"}]}

Validate
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/merchant/repeatingpayment/add/validate
* payeeId:1067978207
* fundingAccountId:649244560
* amount:0.01
* memo:Set up Repeat Payment
* earliestPaymentDate:20180301
* frequency:TWICE_MONTHLY
* dayOfMonth:ONE
* secondDayOfMonth:TWENTYONE
* numberOfPayments:10

{"code":"SUCCESS","formId":"fXwFPqzmET","payeeName":"DummyLink","payeeLabel":"Dummy payee...5623","amount":0.01,"fundingAccountName":"FINN CHECKING (...5896)","memo":"Set up Repeat Payment","model":{"dayOfMonth":"ONE","frequency":"TWICE_MONTHLY","numberOfPayments":10,"openEnded":false,"secondDayOfMonth":"TWENTYONE"},"scheduledDates":[{"paymentDate":"20180301","processDate":"20180222"},{"paymentDate":"20180321","processDate":"20180314"},{"paymentDate":"20180330","processDate":"20180323"},{"paymentDate":"20180420","processDate":"20180413"},{"paymentDate":"20180501","processDate":"20180424"},{"paymentDate":"20180521","processDate":"20180514"}],"firstPaymentDate":"20180301"}

Confirm:

https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/merchant/repeatingpayment/add

formId:fXwFPqzmET

{"code":"SUCCESS","payeeName":"DummyLink","payeeLabel":"Dummy payee...5623","amount":0.01,"fundingAccountName":"FINN CHECKING (...5896)","memo":"Set up Repeat Payment","model":{"dayOfMonth":"ONE","frequency":"TWICE_MONTHLY","numberOfPayments":10,"openEnded":false,"secondDayOfMonth":"TWENTYONE"},"scheduledPaymentDueDate":"20180301","scheduledPaymentId":6913213132,"scheduledPaymentStatus":"PENDING"}



Cancel OnS

Option call:
https://secure07a.chase.com/svc/rr/payments/secure/v1/billpay/card/payment/cancel/option
paymentId:-9

{"code":"SUCCESS","paymentId":-9,"token":0,"amount":1.00,"source":"OTHER"}


Cancel:https://secure07a.chase.com/svc/wr/payments/secure/v1/billpay/card/payment/cancel
* paymentId:-9
* token:0

{"code":"SUCCESS","amount":1.00,"payeeMask":"CREDIT CARD (...2070)"}
