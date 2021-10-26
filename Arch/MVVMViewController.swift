//
//  MVVMViewController.swift
//  Arch
//
//  Created by specktro on 1/3/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

// MARK: MVVMViewController class
final class MVVMViewController: SharedViewController {
  // MARK: - Properties
  var viewModel: GreetingViewModelProtocol? {
    didSet {
      self.viewModel?.greetingDidChange = { [weak self] vm in
        self?.greetingLabel?.text = vm.greeting
      }
    }
  }
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "MVVM"
  }
  
  // MARK: - Private methods
  override func didTapButton(_ button: UIButton) {
    viewModel?.showGreeting()
  }
}
