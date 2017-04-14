//
//  AABaseTransition.m
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import "AABaseTransition.h"

static NSTimeInterval const kDefaultTransitionPresentDuration = 0.4f;
static NSTimeInterval const kDefaultTransitionDismissDuration = 0.2f;

@implementation AABaseTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.isPresenting ? kDefaultTransitionPresentDuration : kDefaultTransitionDismissDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPresenting) {
        [self presentAnimateTransition:transitionContext];
    } else {
        [self dismissAnimateTransition:transitionContext];
    }
}

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
