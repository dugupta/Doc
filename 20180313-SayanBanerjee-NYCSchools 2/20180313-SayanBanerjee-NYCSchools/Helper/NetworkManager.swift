//
//  NetworkManager.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit
typealias Completion = (Any?, Error?) -> Void

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    
    var completion: Completion?
    
    func getData(_ url: String, completion: @escaping Completion) {
        
        self.completion = completion
        let session = URLSession(configuration: .default)
        
        let baseUrl = String(format:NYCSchoolHelper.baseURL() + url)
        
        guard let escapedURLString = baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let request = URL(string: escapedURLString) else { return }
        
        session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                DispatchQueue.main.async {
                    completion(responseData, nil)
                }
            } else {
                completion(nil, error)
            }
            }.resume()
    }
}
