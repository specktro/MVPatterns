//
//  AppDelegate.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    // MARK: - MVC Architecture
    let model = Person(firstName: "Miguel", lastName: "Gómez")
    let view = MVCAppleController()
    view.person = model
    
    // MARK: - MVP Architecture
//    let model = Person(firstName: "Miguel", lastName: "Gómez")
//    let view = MVPViewController()
//    let presenter = GreetingPresenter(view: view, person: model)
//    view.presenter = presenter
    
    // MARK: - MVVM Architecture
//    let model = Person(firstName: "Sprieto", lastName: "Moreno")
//    let viewModel = GreetingViewModel(person: model)
//    let view = MVVMViewController()
//    view.viewModel = viewModel
    
    window?.rootViewController = view
    window?.makeKeyAndVisible()
    
    return true
  }
}

