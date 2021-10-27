//
//  SharedViewController.swift
//  Arch
//
//  Created by specktro on 16/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import UIKit

// MARK: SharedViewController class
class SharedViewController: UIViewController {
  // MARK: - Properties
  weak var greetingLabel: UILabel?
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.largeTitleDisplayMode = .never
    view.backgroundColor = UIColor.gray
    
    let button: UIButton = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("TAP", for: .normal)
    button.setImage(UIImage(systemName: "hand.tap.fill"), for: .normal)
    
    if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title3)
        .withSymbolicTraits([.traitBold])?.withDesign(.rounded) {
      button.titleLabel?.font = UIFont(descriptor: descriptor, size: 0)
    }
    
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    
    let label: UILabel = UILabel(frame: .zero)
    
    if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        .withDesign(.rounded) {
      label.font = UIFont(descriptor: descriptor, size: 0)
    }
    
    label.font = UIFont.preferredFont(forTextStyle: .body)
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)
    self.greetingLabel = label
    
    button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8.0).isActive = true
  }
  
  // MARK: - Abstract method
  @objc func didTapButton(_ button: UIButton) {
    preconditionFailure("You must override this method")
  }
}
