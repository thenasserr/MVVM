//
//  AppDelegate.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    let window = UIWindow(frame: UIScreen.main.bounds)
    let navigationController = UINavigationController(rootViewController: MainViewController())
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    self.window = window
    return true
  }


}

