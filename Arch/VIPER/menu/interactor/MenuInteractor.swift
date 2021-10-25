//
//  MenuInteractor.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MenuInteractor class
final class MenuInteractor: MenuInteractorProtocol {
  // MARK: - Properties
  weak var presenter: MenuPresenter?
  
  // MARK: - Methods
  func getMenu() {
    let options: [String] = ["MVC", "MVP", "MVVM", "VIPER"]
    presenter?.options(options)
  }
  
  func validate(_ selectedOption: String) {
    switch selectedOption {
    case "MVC":
      presenter?.goToMVC()
    case "MVP":
      presenter?.goToMVP()
    case "MVVM":
      presenter?.goToMVVM()
    case "VIPER":
      presenter?.goToVIPER()
    default:
      presenter?.goToError()
    }
  }
}
