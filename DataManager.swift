//
//  DataManager.swift
//  Weather
//
//  Created by Durgesh Lal Gupta on 2/22/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import Foundation
import UIKit

@objc public class DataManger: NSObject {
    
    override public init() {}
    
    public func getMusicFor(_ term: String , completion: @escaping CompletionHandler) -> Void{
        RequestManager().getMusicFor(term) { (success, data, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(false, nil, error)
                }
                return
            }
            if let data = data {
                let dataSource = self.parse(data as! NSData)
                DispatchQueue.main.async {
                    
                    completion(true, dataSource, nil)
                }
            } else {
                // Throw error
                DispatchQueue.main.async {
                    completion(false, nil, error)
                }
            }
        }
    }
    
    public func parse(_ data: NSData) -> [Music]? {
        
        do{
            let res = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            if let dict: NSDictionary = res as? NSDictionary{
                var returnVal: Array = [Music]()
                print("Returned Data \(dict)")
                if let dataArray = dict["results"] as? NSArray {
                    for object in dataArray {
                        if object is NSDictionary {
                            returnVal.append(Music.init(data: (object as? NSDictionary)!))
                        }
                    }
                }
            
                return returnVal
            }
        } catch {
        
        }
        return nil
    }
}

