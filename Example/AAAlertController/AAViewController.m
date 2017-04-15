//
//  AAViewController.m
//  AAAlertController
//
//  Created by aozhimin on 04/14/2017.
//  Copyright (c) 2017 aozhimin. All rights reserved.
//

#import "AAViewController.h"
#import "AAAlertController.h"
#import "AAPresentViewController.h"

typedef NS_ENUM(NSUInteger, AATableViewCellType) {
    AATableViewCellTypeFade = 0,
    AATableViewCellTypeBounce
};


@interface AAViewController () <UITableViewDelegate>

@property (nonatomic, strong) AAAlertController *alertController;

@end

@implementation AAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AAAlertAnimationOptions animationOption;
    if (indexPath.row == AATableViewCellTypeFade) {
        animationOption = AAAlertAnimationOptionFade;
    } else if (indexPath.row == AATableViewCellTypeBounce) {
        animationOption = AAAlertAnimationOptionBounce;
    }
    AAPresentViewController *popupVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                        instantiateViewControllerWithIdentifier:@"AAPresentViewController"];
    popupVC.view.frame = CGRectMake(0, 0, 300, 300);
    AAAlertController *alertController = [[AAAlertController alloc] initWithContentViewController:popupVC
                                                                               andAnimationOption:animationOption];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
