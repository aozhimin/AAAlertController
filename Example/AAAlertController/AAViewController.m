//
//  AAViewController.m
//  AAAlertController
//
//  Created by aozhimin on 04/14/2017.
//  Copyright (c) 2017 aozhimin. All rights reserved.
//

#import "AAViewController.h"
#import "AAAlertController.h"

typedef NS_ENUM(NSUInteger, AATableViewSectionType) {
    AATableViewSectionTypeAlert = 0,
    AATableViewSectionTypeActionSheet,
};

typedef NS_ENUM(NSUInteger, AATableViewCellType) {
    AATableViewCellTypeFade = 0,
    AATableViewCellTypeBounce,
};

static NSString *const AATableViewSectionTypeDescriptions [] = {
    [AATableViewSectionTypeAlert]       = @"Alert",
    [AATableViewSectionTypeActionSheet] = @"ActionSheet",
};

static NSString *const AATableViewCellTypeDescriptions [] = {
    [AATableViewCellTypeFade]   = @"Fade",
    [AATableViewCellTypeBounce] = @"Bounce",
};

@interface AAViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) AAAlertController *alertController;

@end

@implementation AAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableView DataSource && Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sizeof(AATableViewSectionTypeDescriptions) / sizeof(AATableViewSectionTypeDescriptions[0]);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sizeof(AATableViewCellTypeDescriptions) / sizeof(AATableViewCellTypeDescriptions[0]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"tableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ Animation",
                           AATableViewCellTypeDescriptions[indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%@ Style", AATableViewSectionTypeDescriptions[section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AAAlertStyle style;
    UIViewController *popupVC;
    if (indexPath.section == AATableViewSectionTypeAlert) {
        style = AAAlertStyleAlert;
        popupVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                            instantiateViewControllerWithIdentifier:@"AAAlertStyleViewController"];
        popupVC.view.frame = CGRectMake(0, 0, 300, 280);
    } else if (indexPath.section == AATableViewSectionTypeActionSheet) {
        style = AAAlertStyleStyleActionSheet;
        popupVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                   instantiateViewControllerWithIdentifier:@"AAActionSheetStyleViewController"];
        popupVC.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200);
    }
    
    AAAlertAnimationOptions animationOption;
    if (indexPath.row == AATableViewCellTypeFade) {
        animationOption = AAAlertAnimationOptionFade;
    } else if (indexPath.row == AATableViewCellTypeBounce) {
        animationOption = AAAlertAnimationOptionBounce;
    }
    
    AAAlertController *alertController =
    [[AAAlertController alloc] initWithContentViewController:popupVC
                                           andPreferredStyle:style
                                          andAnimationOption:animationOption];
    if (indexPath.section == AATableViewSectionTypeActionSheet) {
        alertController.backgroundDismiss = YES;
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
