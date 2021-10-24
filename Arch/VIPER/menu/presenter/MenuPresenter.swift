//
//  MenuPresenter.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MenuPresenter
final class MenuPresenter: MenuPresenterProtocol {
  // MARK: - Properties
  weak var view: MenuViewProtocol?
  var interactor: MenuInteractorProtocol?
  
  // MARK: - Methods
  func getMenuOptions() {
    interactor?.getMenu()
  }
  
  func options(_ options: [String]) {
    view?.showMenu(options)
  }
}
