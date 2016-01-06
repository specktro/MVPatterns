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
        
        view.backgroundColor = UIColor.grayColor()
        
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        showGreetingButton.setTitle("TAP", forState: .Normal)
        showGreetingButton.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
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
    
    func didTapButton(button: UIButton) {
        let greeting = "Hello" + " " + person.firstName + " " + person.lastName
        greetingLabel.text = greeting
    }
}