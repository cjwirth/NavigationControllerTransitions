//
//  PushTransition.swift
//  NavigationTransitions
//
//  Created by Caesar Wirth on 1/23/16.
//  Copyright © 2016 cjwirth. All rights reserved.
//

import UIKit

class PushTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let transitionDuration: NSTimeInterval = 0.3

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return transitionDuration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let container = transitionContext.containerView(),
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            else {
                transitionContext.completeTransition(true)
                return
        }

        toView.frame = container.frame
        toView.frame.origin.y = CGRectGetMaxY(toView.frame)
        container.addSubview(toView)
        UIView.animateWithDuration(transitionDuration,
            animations: {
                toView.frame = container.frame
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
    }
    
}