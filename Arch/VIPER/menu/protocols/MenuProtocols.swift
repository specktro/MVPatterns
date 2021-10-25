//
//  MenuProtocols.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

protocol MenuViewProtocol: UIViewController {
  var presenter: MenuPresenterProtocol? { get set }
  func showMenu(_ options: [String])
}

protocol MenuPresenterProtocol {
  var view: MenuViewProtocol? { get set }
  var interactor: MenuInteractorProtocol? { get set }
  
  // Input
  func getMenuOptions()
  func selected(_ option: String)
  
  // Output
  func options(_ options: [String])
  func goToMVC()
  func goToMVP()
  func goToMVVM()
  func goToVIPER()
  func goToError()
}

protocol MenuInteractorProtocol: AnyObject {
  var presenter: MenuPresenter? { get set }
  
  // Input
  func getMenu()
  func validate(_ selectedOption: String)
}

protocol MenuRouterProtocol {
  func showMVC(from view: MenuViewProtocol?)
  func showMVP(from view: MenuViewProtocol?)
  func showMVVM(from view: MenuViewProtocol?)
  func showVIPER(from view: MenuViewProtocol?)
  func showError(from view: MenuViewProtocol?)
}

protocol MenuDataManagerProtocol { }
