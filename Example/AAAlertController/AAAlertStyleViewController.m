//
//  AAAlertStyleViewController.m
//  AAAlertController
//
//  Created by dev-aozhimin on 17/4/17.
//  Copyright © 2017年 aozhimin. All rights reserved.
//

#import "AAAlertStyleViewController.h"
#import <uiview-position/UIView+Position.h>

#define DEVICE_FULL_SIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DEVICE_FULL_SIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width)

static inline UIViewAnimationOptions AAAnimationOptionsWithCurve(UIViewAnimationCurve curve) {
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
    }
}

@interface AAAlertStyleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *closeImageView;

@end

@implementation AAAlertStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_closeDidTapped)];
    [self.closeImageView addGestureRecognizer:gesture];
    [self p_addObservers];
    
}

- (void)p_addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(p_keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil
     ];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(p_keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil
     ];
}

- (void)p_closeDidTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Notification Handler

- (void)p_keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info            = [notification userInfo];
    NSTimeInterval duration       = [info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve    = [info[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    UIViewAnimationOptions option = AAAnimationOptionsWithCurve(curve);
    [UIView animateWithDuration:duration
                          delay:0
                        options:option
                     animations:^{
                         self.view.centerY = DEVICE_FULL_SIZE_HEIGHT / 2;
                     }
                     completion:nil];
}

- (void)p_keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info         = [notification userInfo];
    CGRect keyboardEndFrame    = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight     = keyboardEndFrame.size.height;
    CGFloat bottom             = keyboardHeight + CGRectGetHeight(self.view.bounds) >= DEVICE_FULL_SIZE_HEIGHT ?
    CGRectGetMinY(keyboardEndFrame) :
    (DEVICE_FULL_SIZE_HEIGHT - keyboardHeight + CGRectGetHeight(self.view.bounds)) / 2;
    NSTimeInterval duration    = [info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [info[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    UIViewAnimationOptions option = AAAnimationOptionsWithCurve(curve);
    [UIView animateWithDuration:duration
                          delay:0
                        options:option
                     animations:^{
                         self.view.frameBottom = bottom;
                     }
                     completion:nil];
}

@end
