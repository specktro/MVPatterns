//
//  MenuRouter.swift
//  Arch
//
//  Created by specktro on 25/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: MenuRouter class
final class MenuRouter: MenuRouterProtocol {
  // MARK: - Methods
  func createModule() -> MenuViewProtocol {
    let view: MenuViewProtocol = MenuView()
    let presenter: MenuPresenterProtocol = MenuPresenter()
    let interactor: MenuInteractorProtocol = MenuInteractor(options: ["MVC", "MVP", "MVVM", "VIPER", "MVVM + SwiftUI"])
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
  }
  
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
    let messageRouter: MessageRouterProtocol = MessageRouter()
    let newView: MessageViewProtocol = messageRouter.createModule()
    
    view?.navigationController?.pushViewController(newView, animated: true)
  }
  
  func showSwiftUI(from view: MenuViewProtocol?) {
    let model: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let messageViewModel: MessageViewModel = MessageViewModel(person: model)
    let messageView: SimpleMessageView = SimpleMessageView(viewModel: messageViewModel)
    let newView: UIHostingController = UIHostingController(rootView: messageView)
    newView.title = "MVVM + SwiftUI"
    newView.navigationItem.largeTitleDisplayMode = .never
    
    view?.navigationController?.pushViewController(newView, animated: true)
  }
  
  func showError(from view: MenuViewProtocol? = nil) {
    let alert: UIAlertController = UIAlertController(title: "Error", message: "La opcón seleccionada no existe", preferredStyle: .alert)
    view?.present(alert, animated: true, completion: nil)
  }
}
