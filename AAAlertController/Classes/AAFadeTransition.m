//
//  AAFadeTransition.m
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import "AAFadeTransition.h"
#import "AAAlertController.h"

static NSTimeInterval const kFadeAnimationDuration = 0.15f;

@implementation AAFadeTransition

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    AAAlertController *alertController  =
    (AAAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    alertController.backgroundView.alpha = 0.0;
    alertController.contentView.alpha    = 0.0;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    [UIView animateWithDuration:kFadeAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         alertController.backgroundView.alpha = 1.0;
                         alertController.contentView.alpha    = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    AAAlertController *alertController =
    (AAAlertController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [UIView animateWithDuration:kFadeAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         alertController.backgroundView.alpha = 0.0;
                         alertController.contentView.alpha    = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
