//
//  ViewController.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

// MARK: MVCAppleController class
final class MVCAppleController: UIViewController {
  // MARK: - Properties
  var person: Person?
  weak var greetingLabel: UILabel?
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.gray
    
    let button: UIButton = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("TAP", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    
    let label: UILabel = UILabel(frame: .zero)
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
    self.greetingLabel = label
    
    button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8.0).isActive = true
  }
  
  // MARK: - Private methods
  @objc private func didTapButton(_ button: UIButton) {
    guard let person = person else {
      return
    }

    let greeting: String = "Hello" + " " + person.firstName + " " + person.lastName
    greetingLabel?.text = greeting
  }
}
