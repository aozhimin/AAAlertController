//
//  AABounceTransition.m
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import "AABounceTransition.h"
#import "AAAlertController.h"

static CGFloat const kBounceAnimationSpringDamping           = 0.8f;
static CGFloat const kBounceAnimationSpringVelocity          = 15.0f;
static CGFloat const kBounceFromAnimationSpringVelocity      = 10.0f;
static CGFloat const kTransformScaleSmall                    = 0.1f;
static CGFloat const kTransformScaleLarge                    = 1.1f;
static NSTimeInterval const kBounceAnimationPresentDuration  = 0.6f;
static NSTimeInterval const kBounceAnimationDismiss1Duration = 0.13f;
static NSTimeInterval const kBounceAnimationDismiss2Duration = kBounceAnimationDismiss1Duration * 2.0;

@implementation AABounceTransition

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    AAAlertController *alertController  =
    (AAAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    switch (alertController.preferredStyle) {
        case AAAlertStyleAlert:
            alertController.backgroundView.alpha  = 0.0;
            alertController.contentView.alpha     = 0.0;
            alertController.contentView.transform = CGAffineTransformMakeScale(kTransformScaleSmall, kTransformScaleSmall);
            break;
        case AAAlertStyleStyleActionSheet:
            alertController.contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.contentView.frame));
            break;
        default:
            break;
    }
    
    UIView *containerView                 = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    [UIView animateWithDuration:kBounceAnimationPresentDuration
                          delay:0.0
         usingSpringWithDamping:kBounceAnimationSpringDamping
          initialSpringVelocity:kBounceAnimationSpringVelocity
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionNone
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
    [UIView animateWithDuration:kBounceAnimationDismiss1Duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         alertController.contentView.transform = CGAffineTransformMakeScale(kTransformScaleLarge, kTransformScaleLarge);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:kBounceAnimationDismiss2Duration
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^(void){
                                              if (alertController.preferredStyle == AAAlertStyleAlert) {
                                                  alertController.backgroundView.alpha = 0.0;
                                                  alertController.contentView.alpha = 0.0;
                                                  alertController.contentView.transform = CGAffineTransformMakeScale(kTransformScaleSmall, kTransformScaleSmall);
                                              } else if (alertController.preferredStyle == AAAlertStyleStyleActionSheet) {
                                                  alertController.contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.contentView.frame));
                                              }
                                          }
                                          completion:^(BOOL finished) {
                                              [transitionContext completeTransition:YES];
                                          }];
                     }];
}

@end
