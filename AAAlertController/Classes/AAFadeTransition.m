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
    
    if (alertController.preferredStyle == AAAlertStyleAlert) {
        alertController.backgroundView.alpha = 0.0;
        alertController.contentView.alpha = 0.0;
    } else if (alertController.preferredStyle == AAAlertStyleStyleActionSheet) {
        alertController.contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.contentView.frame));
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    [UIView animateWithDuration:kFadeAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         if (alertController.preferredStyle == AAAlertStyleAlert) {
                             alertController.backgroundView.alpha  = 1.0;
                             alertController.contentView.alpha     = 1.0;
                         }
                         alertController.contentView.transform = CGAffineTransformIdentity;
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
                         if (alertController.preferredStyle == AAAlertStyleAlert) {
                             alertController.backgroundView.alpha = 0.0;
                             alertController.contentView.alpha    = 0.0;
                         } else if (alertController.preferredStyle == AAAlertStyleStyleActionSheet) {
                             alertController.contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.contentView.frame));
                         }
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
