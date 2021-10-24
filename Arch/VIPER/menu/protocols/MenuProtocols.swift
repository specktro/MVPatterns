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
  func getMenuOptions()
  func options(_ options: [String])
}

protocol MenuInteractorProtocol: AnyObject {
  var presenter: MenuPresenter? { get set }
  func getMenu()
}

protocol MenuRouterProtocol { }

protocol MenuDataManagerProtocol { }
