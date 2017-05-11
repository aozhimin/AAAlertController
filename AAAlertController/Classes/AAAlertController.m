//
//  AAAlertController.m
//  Pods
//
//  Created by dev-aozhimin on 17/4/14.
//
//

#import "AAAlertController.h"
#import "AABaseTransition.h"
#import "AAFadeTransition.h"
#import "AABounceTransition.h"

#define DEVICE_FULL_SIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DEVICE_FULL_SIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width)

static CGFloat const kDefaultBackgroundViewAlpha = 0.5f;

@interface AAAlertController ()

@property (nonatomic, assign) AAAlertAnimationOptions animationOption;
@property (nonatomic, strong) AABaseTransition        *transition;
@property (nonatomic, assign) UIInterfaceOrientation  originalOrientation;

@end

@implementation AAAlertController

- (instancetype)initWithContentViewController:(UIViewController *)viewController {
    return [self initWithContentViewController:viewController
                            andAnimationOption:AAAlertAnimationOptionFade];
}

- (instancetype)initWithContentViewController:(UIViewController *)viewController
                           andAnimationOption:(AAAlertAnimationOptions)animationOption {
    return [self initWithContentViewController:viewController
                             andPreferredStyle:AAAlertStyleAlert
                            andAnimationOption:animationOption];
}

- (instancetype)initWithContentViewController:(UIViewController *)viewController
                            andPreferredStyle:(AAAlertStyle)preferredStyle
                           andAnimationOption:(AAAlertAnimationOptions)animationOption {
    if (self = [self initWithNibName:nil bundle:nil]) {
        _contentViewController = viewController;
        _animationOption       = animationOption;
        _preferredStyle        = preferredStyle;
        [self p_setup];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_addContentViewController];
    [self.view insertSubview:self.backgroundView atIndex:0];
}

- (void)p_setup {
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext                 = YES;
    self.modalPresentationStyle                     = UIModalPresentationCustom;
    self.transitioningDelegate                      = self;
    self.originalOrientation                        = [UIApplication sharedApplication].statusBarOrientation;
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidChangeStatusBarOrientationNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                      if (self.originalOrientation != [UIApplication sharedApplication].statusBarOrientation) {
                                                          weakSelf.contentViewController.view.center = weakSelf.view.center;
                                                          weakSelf.originalOrientation = [UIApplication sharedApplication].statusBarOrientation;
                                                      }
                                                  }];
}

- (void)p_addContentViewController {
    [self addChildViewController:self.contentViewController];
    [self.view addSubview:self.contentViewController.view];
    if (self.preferredStyle == AAAlertStyleAlert) {
        self.contentViewController.view.center = self.view.center;
    } else if (self.preferredStyle == AAAlertStyleStyleActionSheet) {
        self.contentViewController.view.center =
        CGPointMake(DEVICE_FULL_SIZE_WIDTH / 2,
                    DEVICE_FULL_SIZE_HEIGHT - CGRectGetHeight(self.contentViewController.view.bounds) / 2);
    }
    [self.contentViewController didMoveToParentViewController:self];
    self.contentView = self.contentViewController.view;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    self.transition.isPresenting = YES;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.isPresenting = NO;
    return self.transition;
}

#pragma mark - Event

- (void)backgroundDidTapped:(UITapGestureRecognizer *)tapGesture {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Getter & Setter
- (AABaseTransition *)transition {
    if (!_transition) {
        _transition = [[self p_transitionClassFromAnimationOption:self.animationOption] new];
    }
    return _transition;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView                        = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                                          DEVICE_FULL_SIZE_WIDTH,
                                                                                          DEVICE_FULL_SIZE_HEIGHT)];
        _backgroundView.backgroundColor        = [[UIColor blackColor] colorWithAlphaComponent:kDefaultBackgroundViewAlpha];
        _backgroundView.autoresizingMask       = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UITapGestureRecognizer *tapGesture     = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(backgroundDidTapped:)];
        _backgroundView.userInteractionEnabled = self.canBackgroundDismiss;
        [_backgroundView addGestureRecognizer:tapGesture];
    }
    return _backgroundView;
}

- (void)setBackgroundDismiss:(BOOL)backgroundDismiss {
    self.backgroundView.userInteractionEnabled = backgroundDismiss;
}

#pragma mark - Helper

- (Class)p_transitionClassFromAnimationOption:(AAAlertAnimationOptions)animationOption {
    switch (animationOption) {
        case AAAlertAnimationOptionFade:
            return [AAFadeTransition class];
        case AAAlertAnimationOptionBounce:
            return [AABounceTransition class];
        default:
            return nil;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
