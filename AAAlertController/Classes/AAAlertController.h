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
 the dynamic effect to present AAAlertController object
 
 - AAAlertAnimationOptionFade: Fade animation
 - AAAlertAnimationOptionBounce: Bounce animation
 */
typedef NS_ENUM(NSInteger, AAAlertAnimationOptions) {
    AAAlertAnimationOptionFade = 0,
    AAAlertAnimationOptionBounce,
};

/**
 The style to use when presenting the alert controller.

 - AAAlertStyleAlert: An alert displayed modally for the app.
 - AAAlertStyleStyleActionSheet: An action sheet displayed in the context of the view controller that presented it.
 */
typedef NS_ENUM(NSInteger, AAAlertStyle) {
    AAAlertStyleAlert = 0,
    AAAlertStyleStyleActionSheet
};

/**
 自定义的弹出视图控制器
 */
@interface AAAlertController : UIViewController

/**
 The style of the alert controller.
 @remarks The value of this property is set to the value you specified in the initWithContentViewController:andPreferredStyle:andAnimationOption: method. This value determines how the alert is displayed onscreen.
 */
@property (nonatomic, assign, readonly) AAAlertStyle preferredStyle;

/**
 Returns the content view of the alert object.
 */
@property (nonatomic, strong) UIView           *contentView;

/**
 The view that provides the background appearance.
 */
@property (nonatomic, strong) UIView           *backgroundView;

/**
 The view controller responsible for the content portion of the alert controller.
 */
@property (nonatomic, strong) UIViewController *contentViewController;

/**
 whether dismiss or not when user click the background view
 */
@property (nonatomic, assign, getter=canBackgroundDismiss) BOOL backgroundDismiss;

/**
 Returns an initialized alert controller object.
 
 @param viewController The view controller for managing the alert content. This parameter must not be nil.
 @return An initialized alert controller object.
 */
- (instancetype)initWithContentViewController:(UIViewController *)viewController NS_DESIGNATED_INITIALIZER;

/**
 Returns an initialized alert controller object.
 
 @param viewController The view controller for managing the alert content. This parameter must not be nil.
 @param animationOption The animation to present view controller
 @return An initialized alert controller object.
 */
- (instancetype)initWithContentViewController:(UIViewController *)viewController
                           andAnimationOption:(AAAlertAnimationOptions)animationOption NS_DESIGNATED_INITIALIZER;

/**
 Returns an initialized alert controller object.

 @param viewController The view controller for managing the alert content. This parameter must not be nil.
 @param preferredStyle  The style to use when presenting the alert controller. Use this parameter to configure the alert controller as an action sheet or as a modal alert.
 @param animationOption The animation to present view controller
 @return An initialized alert controller object.
 */
- (instancetype)initWithContentViewController:(UIViewController *)viewController
                            andPreferredStyle:(AAAlertStyle)preferredStyle
                           andAnimationOption:(AAAlertAnimationOptions)animationOption NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
