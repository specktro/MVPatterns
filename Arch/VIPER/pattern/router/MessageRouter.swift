//
//  MessageRouter.swift
//  Arch
//
//  Created by specktro on 25/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MessageRouter class
final class MessageRouter: MessageRouterProtocol {
  // MARK: - Methods
  func createModule() -> MessageViewProtocol {
    let model: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let view: MessageViewProtocol = MessageView()
    let presenter: MessagePresenterProtocol = MessagePresenter()
    let interactor: MessageInteractorProtocol = MessageInteractor()
    
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.person = model
    
    return view
  }
}
