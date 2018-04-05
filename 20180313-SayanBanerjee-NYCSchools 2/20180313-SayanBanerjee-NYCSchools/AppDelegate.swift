//
//  AppDelegate.swift
//  20180313-SayanBanerjee-NYCSchools
//
//  Created by Sayan Banerjee on 3/12/18.
//  Copyright © 2018 Sayan Banerjee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

protocol Ordered {
  func precedes(other: Self) -> Bool
}

struct Number: Ordered {
  var value: Double = 0
  func precedes(other: Number) -> Bool {
    return value < other.value
  }
}

//class Label: Ordered {
//  func precedes(other: Ordered) -> Bool {
//    return true
//  }
//
//  var text: String = ""
//}

struct Color {
  let red: Double
  let green: Double
  let blue: Double
  
  init(red: Double = 0.0, green: Double = 0.0, blue: Double = 0.0) {
    self.red = red
    self.green = green
    self.blue = blue
  }
}

struct ErrorOptions {
  let message: String
  let showArrow: Bool
  let backgroundColor: Color
  let size: CGSize
  let canDismissByTap: Bool
  
  init(message: String = "Error!", shouldShowArrow: Bool = true, backgroundColor: Color = Color(), size: CGSize = .zero, canDismissByTappingAnywhere canDismiss: Bool = true) {
    self.message = message
    self.showArrow = shouldShowArrow
    self.backgroundColor = backgroundColor
    self.size = size
    self.canDismissByTap = canDismiss
  }
}

protocol ErrorPopoverRenderer {
  func presentError(errorOptions: ErrorOptions)
}

extension ErrorPopoverRenderer where Self: UIViewController {
  func presentError(errorOptions: ErrorOptions = ErrorOptions()) {
    //Add default implementation here and provide default values to your Error View.
  }
}

class KrakenViewController: UIViewController, ErrorPopoverRenderer {
  func failedToEatHuman() {
    //…
    //Throw error because the Kraken sucks at eating Humans today.
    presentError(errorOptions: ErrorOptions(
      message: "Oh noes! I didn't get to eat the Human!",
      size: CGSize(width: 1000.0, height: 200.0)
    ))
    //Woohoo! We can provide whatever parameters we want, or no parameters at all!
    
    presentError(errorOptions: ErrorOptions(message: "new message"))
  }
}














