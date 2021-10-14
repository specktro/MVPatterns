//
//  GreetingViewModel.swift
//  Arch
//
//  Created by specktro on 1/3/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import Foundation

// MARK: GreetingViewModelProtocol protocol
protocol GreetingViewModelProtocol {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
  init(person: Person)
  func showGreeting()
}

// MARK: GreetingViewModel class
final class GreetingViewModel: GreetingViewModelProtocol {
  // MARK: - Properties
  var person: Person
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }
  
  // MARK: - GreetingViewModelProtocol methods
  required init(person: Person) {
    self.person = person
  }
  
  func showGreeting() {
    self.greeting = "Hello" + " " + person.firstName + " " + person.lastName
  }
}
