//
//  ViewController.swift
//  Arch
//
//  Created by specktro on 1/2/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

class MVCAppleController: UIViewController {
  var person: Person!
  let showGreetingButton = UIButton()
  let greetingLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.gray
    showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
    showGreetingButton.setTitle("TAP", for: .normal)
    showGreetingButton.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
    view.addSubview(showGreetingButton)
    
    greetingLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(greetingLabel)
    
    var constraints = [NSLayoutConstraint(item: showGreetingButton,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: .centerX,
                                          multiplier: 1.0,
                                          constant: 0.0)]
    constraints.append(NSLayoutConstraint(item: showGreetingButton,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: .centerY,
                                          multiplier: 1.0,
                                          constant: 0.0))
    constraints.append(NSLayoutConstraint(item: greetingLabel,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: showGreetingButton,
                                          attribute: .centerX,
                                          multiplier: 1.0,
                                          constant: 0.0))
    constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[button]-[label]", options: [], metrics: nil, views: ["button": showGreetingButton, "label": greetingLabel]))
    
    NSLayoutConstraint.activate(constraints)
  }
  
  @objc func didTapButton(button: UIButton) {
    let greeting = "Hello" + " " + person.firstName + " " + person.lastName
    greetingLabel.text = greeting
  }
}
