//
//  AAAlertController.h
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 展示动效
 
 - AAAlertAnimationOptionFade: 渐变动画
 - AAAlertAnimationOptionBounce: 弹跳动画
 */
typedef NS_ENUM(NSInteger, AAAlertAnimationOptions) {
    AAAlertAnimationOptionFade = 0,
    AAAlertAnimationOptionBounce,
};

/**
 自定义的弹出视图控制器
 */
@interface AAAlertController : UIViewController

/**
 内容视图
 */
@property (nonatomic, strong) UIView           *contentView;

/**
 背景视图
 */
@property (nonatomic, strong) UIView           *backgroundView;

/**
 内容视图控制器
 */
@property (nonatomic, strong) UIViewController *contentViewController;

/**
 点击背景后，弹出视图控制器是否会消失
 */
@property (nonatomic, assign, getter=canBackgroundDismiss) BOOL backgroundDismiss;

/**
 初始化方法
 
 @param viewController 被弹出的内容视图控制器
 @return 弹出视图控制器
 */
- (instancetype)initWithContentViewController:(UIViewController *)viewController NS_DESIGNATED_INITIALIZER;

/**
 初始化方法
 
 @param viewController 被弹出的内容视图控制器
 @param animationOption 展示动效
 @return 弹出视图控制器
 */
- (instancetype)initWithContentViewController:(UIViewController *)viewController
                           andAnimationOption:(AAAlertAnimationOptions)animationOption NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
