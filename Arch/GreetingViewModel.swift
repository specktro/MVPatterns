//
//  GreetingViewModel.swift
//  Arch
//
//  Created by specktro on 1/3/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import Foundation

protocol GreetingViewModelProtocol {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
  init(person: Person)
  func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
  var person: Person
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  
  required init(person: Person) {
    self.person = person
  }
  
  @objc func showGreeting() {
    greeting = "Hello" + " " + person.firstName + " " + person.lastName
  }
}
