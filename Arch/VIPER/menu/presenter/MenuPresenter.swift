//
//  MenuPresenter.swift
//  Arch
//
//  Created by specktro on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MenuPresenter
final class MenuPresenter: MenuPresenterProtocol {
  // MARK: - Properties
  weak var view: MenuViewProtocol?
  var interactor: MenuInteractorProtocol?
  private lazy var router: MenuRouterProtocol = MenuRouter()
  
  // MARK: - Methods
  func getMenuOptions() {
    interactor?.getMenu()
  }
  
  func options(_ options: [String]) {
    view?.showMenu(options)
  }
  
  func selected(_ option: String) {
    interactor?.validate(option)
  }
  
  func goToMVC() {
    router.showMVC(from: view)
  }
  
  func goToMVP() {
    router.showMVP(from: view)
  }
  
  func goToMVVM() {
    router.showMVVM(from: view)
  }
  
  func goToVIPER() {
    router.showVIPER(from: view)
  }
  
  func goToSwiftUI() {
    router.showSwiftUI(from: view)
  }
  
  func goToError() {
    router.showError(from: view)
  }
}
