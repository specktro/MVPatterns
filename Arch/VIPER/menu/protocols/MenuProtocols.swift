//
//  MenuProtocols.swift
//  Arch
//
//  Created by specktro on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

// MARK: MenuViewProtocol protocol
protocol MenuViewProtocol: UIViewController {
  var presenter: MenuPresenterProtocol? { get set }
  func showMenu(_ options: [String])
}

// MARK: MenuPresenterProtocol protocol
protocol MenuPresenterProtocol: AnyObject {
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
  func goToSwiftUI()
  func goToError()
}

// MARK: MenuInteractorProtocol protocol
protocol MenuInteractorProtocol: AnyObject {
  var presenter: MenuPresenterProtocol? { get set }
  var options: [String] { get set }
  
  // Input
  init (options: [String])
  func getMenu()
  func validate(_ selectedOption: String)
}

// MARK: MenuRouterProtocol protocol
protocol MenuRouterProtocol {
  func createModule() -> MenuViewProtocol
  func showMVC(from view: MenuViewProtocol?)
  func showMVP(from view: MenuViewProtocol?)
  func showMVVM(from view: MenuViewProtocol?)
  func showVIPER(from view: MenuViewProtocol?)
  func showSwiftUI(from view: MenuViewProtocol?)
  func showError(from view: MenuViewProtocol?)
}
