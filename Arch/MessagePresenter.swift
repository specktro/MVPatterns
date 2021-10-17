//
//  MessagePresenter.swift
//  Arch
//
//  Created by specktro on 17/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

final class MessagePresenter: MessagePresenterProtocol {
  weak var view: MessageViewProtocol?
  var interactor: MessageInteractorProtocol?
  
  func askMessage() {
    interactor?.prepareMessage()
  }
  
  func retrieve(message: String) {
    view?.show(message)
  }
}
