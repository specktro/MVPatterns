//
//  GreetingPresenter.swift
//  Arch
//
//  Created by specktro on 1/3/16.
//  Copyright © 2016 specktro. All rights reserved.
//

// MARK: GreetingView protocol
protocol GreetingView: AnyObject {
  func setGreeting(_ greeting: String)
}

// MARK: GreetingViewPresenter protocol
protocol GreetingViewPresenter {
  init(view: GreetingView, person: Person)
  func showGreeting()
}

// MARK: GreetingPresenter class
final class GreetingPresenter: GreetingViewPresenter {
  // MARK: - Properties
  weak var view: GreetingView?
  let person: Person
  
  // MARK: - GreetingViewPresenter protocol methods
  required init(view: GreetingView, person: Person) {
    self.view = view
    self.person = person
  }
  
  func showGreeting() {
    let greeting: String = "Hello " + person.firstName + " " + person.lastName
    view?.setGreeting(greeting)
  }
}
