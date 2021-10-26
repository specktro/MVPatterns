//
//  MenuInteractor.swift
//  Arch
//
//  Created by specktro on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MenuInteractor class
final class MenuInteractor: MenuInteractorProtocol {
  // MARK: - Properties
  weak var presenter: MenuPresenterProtocol?
  var options: [String]
  
  // MARK: - Methods
  init(options: [String]) {
    self.options = options
  }
  
  func getMenu() {
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
    case "MVVM + SwiftUI":
      presenter?.goToSwiftUI()
    default:
      presenter?.goToError()
    }
  }
}
