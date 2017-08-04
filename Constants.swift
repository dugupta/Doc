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
