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
    
    // MARK: - MVC Architecture
//    let model = Person(firstName: "Miguel", lastName: "Gómez")
//    let view = MVCAppleController()
//    view.person = model
    
    // MARK: - MVP Architecture
    let model = Person(firstName: "Sprieto", lastName: "Moreno")
    let view = MVPViewController()
    let presenter = GreetingPresenter(view: view, person: model)
    view.presenter = presenter
    
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

