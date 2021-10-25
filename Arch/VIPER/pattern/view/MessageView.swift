//
//  MessageView.swift
//  Arch
//
//  Created by specktro on 17/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

// MARK: MessageView class
final class MessageView: SharedViewController, MessageViewProtocol {
  // MARK: - Properties
  var presenter: MessagePresenterProtocol?
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "VIPER"
  }
  
  // MARK: - SharedViewController method
  override func didTapButton(_ button: UIButton) {
    presenter?.askMessage()
  }
  
  // MARK: - MessageViewProtocol
  func show(_ message: String) {
    greetingLabel?.text = message
  }
}
