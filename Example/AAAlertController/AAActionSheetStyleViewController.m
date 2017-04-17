//
//  AAActionSheetStyleViewController.m
//  AAAlertController
//
//  Created by dev-aozhimin on 17/4/17.
//  Copyright © 2017年 aozhimin. All rights reserved.
//

#import "AAActionSheetStyleViewController.h"
#import "AAActionSheetCollectionViewCell.h"

static NSString * const kBottomSheetCellReuseIdentifier = @"kBottomSheetCellReuseIdentifier";


typedef NS_ENUM(NSUInteger, AAAvatarItemSourceType) {
    AAAvatarItemSourceTypeCamera,
    AAAvatarItemSourceTypePhotoLibrary,
    AAAvatarItemSourceTypeQQ,
    AAAvatarItemSourceTypeWechat,
    AAAvatarItemSourceTypeWeibo
};

static NSString *const AAAvatarItemTitles [] = {
    [AAAvatarItemSourceTypeCamera]       = @"camera",
    [AAAvatarItemSourceTypePhotoLibrary] = @"album",
    [AAAvatarItemSourceTypeQQ]           = @"QQ",
    [AAAvatarItemSourceTypeWechat]       = @"wechat",
    [AAAvatarItemSourceTypeWeibo]        = @"weibo",
};

@interface AABottomSheetItem : NSObject

@property (nonatomic, copy  ) NSString *name;

@property (nonatomic, strong) UIImage  *image;

- (instancetype)initWithName:(NSString *)name
                    andImage:(UIImage *)image;

@end


@implementation AABottomSheetItem

- (instancetype)initWithName:(NSString *)name andImage:(UIImage *)image {
    if (self = [super init]) {
        _name  = name;
        _image = image;
    }
    return self;
}

@end

@interface AAActionSheetStyleViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation AAActionSheetStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AAActionSheetCollectionViewCell *cell = [collectionView
                                               dequeueReusableCellWithReuseIdentifier:kBottomSheetCellReuseIdentifier
                                               forIndexPath:indexPath];
    AABottomSheetItem *item               = self.items[indexPath.row];
    cell.titleLabel.text                  = item.name;
    cell.imageView.image                  = item.image;
    return cell;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
        for (NSInteger i = AAAvatarItemSourceTypeCamera; i <= AAAvatarItemSourceTypeWeibo; i++) {
            UIImage *image = [UIImage imageNamed:AAAvatarItemTitles[i]];
            AABottomSheetItem *item = [[AABottomSheetItem alloc] initWithName:AAAvatarItemTitles[i]
                                                                     andImage:image];
            [_items addObject:item];
        }
    }
    return _items;
}

@end
