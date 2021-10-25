//
//  MVPViewController.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

// MARK: MVPViewController class
final class MVPViewController: SharedViewController, GreetingView {
  // MARK: - Properties
  var presenter: GreetingPresenter?
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "MVP"
  }
  
  // MARK: - Private methods
  override func didTapButton(_ button: UIButton) {
    presenter?.showGreeting()
  }
  
  // MARK: - GreetingView protocol methods
  func setGreeting(_ greeting: String) {
    greetingLabel?.text = greeting
  }
}
