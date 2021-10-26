//
//  ShowMessageProtocols.swift
//  Arch
//
//  Created by specktro on 17/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

// MARK: MessageViewProtocol
protocol MessageViewProtocol: UIViewController {
  var presenter: MessagePresenterProtocol? { get set }
  
  // Output
  func show(_ message: String)
}

// MARK: MessagePresenterProtocol protocol
protocol MessagePresenterProtocol: AnyObject {
  var view: MessageViewProtocol? { get set }
  var interactor: MessageInteractorProtocol? { get set }
  
  // Input
  func askMessage()
  
  // Output
  func retrieve(message: String)
}

// MARK: MessageInteractorProtocol protocol
protocol MessageInteractorProtocol: AnyObject {
  var presenter: MessagePresenterProtocol? { get set }
  var person: Person? { get set }
  
  // Input
  func prepareMessage()
}

// MARK: MessageRouterProtocol protocol
protocol MessageRouterProtocol {
  func createModule() -> MessageViewProtocol
}
