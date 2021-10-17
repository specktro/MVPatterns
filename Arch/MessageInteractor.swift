//
//  MessageInteractor.swift
//  Arch
//
//  Created by specktro on 17/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MessageInteractor class
final class MessageInteractor: MessageInteractorProtocol {
  // MARK: - Properties
  weak var presenter: MessagePresenterProtocol?
  var person: Person?
  
  // MARK: - MessageInteractorProtocol methods
  func prepareMessage() {
    guard let person = person else {
      preconditionFailure("The person model was not provided")
    }
    
    let greeting: String = "Hello" + " " + person.firstName + " " + person.lastName
    presenter?.retrieve(message: greeting)
  }
}
