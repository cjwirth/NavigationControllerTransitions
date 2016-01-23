//
//  ViewController.swift
//  NavigationTransitions
//
//  Created by Caesar Wirth on 1/23/16.
//  Copyright © 2016 cjwirth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transitionController = NavigationTransitionController()
    let transition = PushTransition()

    @IBAction func openNext() {
        let nextController = UIViewController()
        nextController.view.backgroundColor = .redColor()

        if let navControl = navigationController {

            // Use the custom transition controller to push the controller on with the transition
            // This way we can preserve the swipe back functionality that gets cancelled if we override the delegate
            transitionController.pushViewController(nextController, ontoNavigationController: navControl, animatedTransition: transition)
        }
    }

}
