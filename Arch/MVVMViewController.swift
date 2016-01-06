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
        
        view.backgroundColor = UIColor.grayColor()
        
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        showGreetingButton.setTitle("TAP", forState: .Normal)
        showGreetingButton.addTarget(viewModel, action: "showGreeting", forControlEvents: .TouchUpInside)
        view.addSubview(showGreetingButton)
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        
        var constraints = [NSLayoutConstraint(item: showGreetingButton,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)]
        constraints.append(NSLayoutConstraint(item: showGreetingButton,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        constraints.append(NSLayoutConstraint(item: greetingLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: showGreetingButton,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0))
        constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[button]-[label]",
            options: [],
            metrics: nil,
            views: ["button": showGreetingButton, "label": greetingLabel]))
        
        for con in constraints {
            con.active = true
        }
    }
}
