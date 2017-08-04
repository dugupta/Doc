//
//  RequestManager.swift
//  Weather
//
//  Created by Durgesh Lal Gupta on 2/22/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import Foundation
import UIKit

public struct RequestManager {
    
    func getMusicFor(_ term: String, completion: @escaping CompletionHandler) -> Void {
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        guard let urlString = RequestBuilder().getBaseURL() else {
            print("URLString can't be nil")
            return
        }
        
        guard let url = URL.init(string: urlString + "\(term)") else {
            print("URL can't be nil")
            return
        }
        
        
        let request = NSMutableURLRequest.init(url: url)
        request.httpMethod = "GET"
        print("Connecting....\(request)")
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard error == nil else {
                completion(false, nil , error)
                return
            }
            print("Response Header \(response)")
            print("Response Data \(data)")
            completion(true, data , nil)
            
        }
        task.resume()
    }
    
}

