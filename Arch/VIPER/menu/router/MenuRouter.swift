//
//  MenuRouter.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 25/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MenuRouter class
final class MenuRouter: MenuRouterProtocol {
  // MARK: - Methods
  func showMVC(from view: MenuViewProtocol? = nil) {
    let model: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let newView: MVCViewController = MVCViewController()
    newView.person = model

    view?.navigationController?.pushViewController(newView, animated: true)
  }
  
  func showMVP(from view: MenuViewProtocol? = nil) {
    let model: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let newView: MVPViewController = MVPViewController()
    let presenter: GreetingPresenter = GreetingPresenter(view: newView, person: model)
    newView.presenter = presenter
    
    view?.navigationController?.pushViewController(newView, animated: true)
  }
  
  func showMVVM(from view: MenuViewProtocol? = nil) {
    let model: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let viewModel: GreetingViewModel = GreetingViewModel(person: model)
    let newView: MVVMViewController = MVVMViewController()
    newView.viewModel = viewModel
    
    view?.navigationController?.pushViewController(newView, animated: true)
  }
  
  func showVIPER(from view: MenuViewProtocol? = nil) {
    debugPrint(#function)
  }
  
  func showError(from view: MenuViewProtocol? = nil) {
    debugPrint(#function)
  }
}
