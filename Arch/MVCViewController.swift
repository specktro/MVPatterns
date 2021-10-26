//
//  MVCViewController.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

// MARK: MVCViewController class
final class MVCViewController: SharedViewController {
  // MARK: - Properties
  var person: Person?
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "MVC"
  }
  
  // MARK: - Private methods
  override func didTapButton(_ button: UIButton) {
    guard let person = person else {
      return
    }

    let greeting: String = "Hello" + " " + person.firstName + " " + person.lastName
    greetingLabel?.text = greeting
  }
}
