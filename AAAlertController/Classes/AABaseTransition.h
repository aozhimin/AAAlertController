//
//  AABaseTransition.h
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The root class of transition class hierarchies, from which subclasses inherit the ability to implement the animations for a custom view controller transition.
 */
@interface AABaseTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 Whether The view controller is presenting.
 */
@property (nonatomic, assign) BOOL isPresenting;

/**
 Asks your animator object for the duration (in seconds) of the transition animation.
 @param transitionContext The context object containing information to use during the transition.
 @return The duration, in seconds, of your custom transition animation.
 */
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

/**
 Transition animation when is presenting the view controller
 
 @param transitionContext The context object containing information to use during the transition.
 
 @attentions This method will be invoked in animateTransition: method if the isPresenting property is YES.
 */
- (void)presentAnimateTransition:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

/**
 Transition animation when is dismissing the view controller
 
 @param transitionContext The context object containing information to use during the transition.
 
 @attentions This method will be invoked in animateTransition: method if the isPresenting property is NO.
 */
- (void)dismissAnimateTransition:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
