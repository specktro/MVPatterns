//
//  MVVMViewController.swift
//  Arch
//
//  Created by specktro on 1/3/16.
//  Copyright © 2016 specktro. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController {
  let showGreetingButton = UIButton()
  let greetingLabel = UILabel()
  
  var viewModel: GreetingViewModelProtocol! {
    didSet {
      self.viewModel.greetingDidChange = { [unowned self] vm in
        self.greetingLabel.text = vm.greeting
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.gray
    
    showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
    showGreetingButton.setTitle("TAP", for: .normal)
    showGreetingButton.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)

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
  
  @objc func tapped(_ button: UIButton) {
    viewModel.showGreeting()
  }
}
