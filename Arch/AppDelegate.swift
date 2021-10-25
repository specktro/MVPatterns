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
    
    // MARK: - MVP Architecture
//    let view: MVPViewController = MVPViewController()
//    let presenter: GreetingPresenter = GreetingPresenter(view: view, person: model)
//    view.presenter = presenter
    
    // MARK: - MVVM Architecture
//    let viewModel: GreetingViewModel = GreetingViewModel(person: model)
//    let view: MVVMViewController = MVVMViewController()
//    view.viewModel = viewModel
    
    let view: MenuViewProtocol = MenuView()
    let presenter: MenuPresenter = MenuPresenter()
    let interactor: MenuInteractor = MenuInteractor()
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    interactor.presenter = presenter
    window?.rootViewController = UINavigationController(rootViewController: view)
    window?.makeKeyAndVisible()
    
    return true
  }
}

