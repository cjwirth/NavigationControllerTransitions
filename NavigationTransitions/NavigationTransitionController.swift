//
//  NavigationTransitionController.swift
//  NavigationTransitions
//
//  Created by Caesar Wirth on 1/23/16.
//  Copyright © 2016 cjwirth. All rights reserved.
//

import UIKit

/// Class that can be used to control the push and pop transitions of a UINavigationController.
/// By using it, you can preserve the built-in swipe back functionality that doesn't work if 
/// the UINavigationController's delegate is overwritten.
class NavigationTransitionController: NSObject, UINavigationControllerDelegate {

    /// Transition that we will use to transition
    /// We need to hold onto the transition so we can give it to the UINavigationController in
    /// `navigationController: animationControllerForOperatio: fromViewController: toViewController:`
    var transition: UIViewControllerAnimatedTransitioning?


    /// The delegate that the UINavigationController had before the transition.
    /// We need it so we can return it when we are done with the transition
    private weak var previousDelegate: UINavigationControllerDelegate?

    /// Pushes the given view controller onto the navigation controller with the given transition.
    /// Temporarily overrides the UINavigationController's delegate to provide the animated transition.
    /// - parameter controller: UIViewController to animate onto the UINavigationController
    /// - parameter navigationController: UINavigationController who will recieve the new view controller
    /// - parameter animatedTransition: Animated transition to be used when pushing the view controller on
    func pushViewController(controller: UIViewController, ontoNavigationController navigationController: UINavigationController, animatedTransition: UIViewControllerAnimatedTransitioning) {
        previousDelegate = navigationController.delegate
        transition = animatedTransition
        navigationController.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }

    /// Pops the top UIViewController off the UINavigationController by using the given transition.
    /// Temporarily overrides the UINavigationController's delegate to provide the animated transition.
    /// - parameter navigationController: UINavigationController to pop the top view controller off of
    /// - parameter aniatedTransition: Animated transition to use when popping off the controller
    func popNavigationController(navigationController: UINavigationController, animatedTransition: UIViewControllerAnimatedTransitioning) {
        previousDelegate = navigationController.delegate
        transition = animatedTransition
        navigationController.delegate = self
        navigationController.popToRootViewControllerAnimated(true)
    }

    // MARK: UINavigationControllerDelegate

    // We should probably also implement some of the other
    // UINavigationControllerDelegate methods, and forward them back
    // to the previousDelegate.

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // We just need to return the transition we were told to use
        return transition
    }

    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        // Now that the transition is complete, 
        // so we'll return delegate to what it used to be
        navigationController.delegate = previousDelegate
        previousDelegate = nil
    }

}

