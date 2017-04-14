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
 展示过渡动效的基类
 */
@interface AABaseTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 是否正在展示
 */
@property (nonatomic, assign) BOOL isPresenting;

/**
 过渡动效的时间间隔
 
 @param transitionContext 过渡环境
 @return 返回过渡动效的时间间隔
 */
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

/**
 控制展示时的动效
 
 @param transitionContext 过渡环境
 */
- (void)presentAnimateTransition:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

/**
 控制消失时的动效
 
 @param transitionContext 过渡环境
 */
- (void)dismissAnimateTransition:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
