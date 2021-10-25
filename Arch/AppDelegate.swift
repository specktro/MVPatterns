//
//  AppDelegate.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

@main

// MARK: AppDelegate class
final class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?
  
  // MARK: - UIApplicationDelegate methods
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.tintColor = .white
    
    let menuRouter: MenuRouterProtocol = MenuRouter()
    let view: MenuViewProtocol = menuRouter.createModule()
    
    window?.rootViewController = UINavigationController(rootViewController: view)
    window?.makeKeyAndVisible()
    
    return true
  }
}

