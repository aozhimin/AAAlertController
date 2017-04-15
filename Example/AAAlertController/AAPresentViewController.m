//
//  AAPresentViewController.m
//  AAAlertController
//
//  Created by dev-aozhimin on 17/4/14.
//  Copyright © 2017年 aozhimin. All rights reserved.
//

#import "AAPresentViewController.h"

@interface AAPresentViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *closeImageView;

@end

@implementation AAPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_closeDidTapped)];
    [self.closeImageView addGestureRecognizer:gesture];
}

- (void)p_closeDidTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
