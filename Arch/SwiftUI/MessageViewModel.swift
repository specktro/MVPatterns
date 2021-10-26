//
//  MessageViewModel.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 25/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import Foundation

// MARK: MessageViewModelProtocol protocol
protocol MessageViewModelProtocol {
  var greeting: String { get }
  init(person: Person)
  func showGreeting()
}

// MARK: MessageViewModel class
final class MessageViewModel: ObservableObject, MessageViewModelProtocol {
  // MARK: - Properties
  @Published var greeting: String
  var person: Person
  
  // MARK: - Initializer
  init(person: Person) {
    self.greeting = ""
    self.person = person
  }
  
  // MARK: - Methods
  func showGreeting() {
    self.greeting = "Hello" + " " + person.firstName + " " + person.lastName
  }
}
