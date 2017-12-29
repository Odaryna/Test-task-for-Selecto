//
//  DesignVC.m
//  Test task
//
//  Created by Odaryna on 12/27/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "DesignVC.h"
#import "ImageCVCell.h"

#define BTNS_COLOR [UIColor colorWithRed:94.0f/255.f green:179.0f/255.f blue:188.0f/255.f alpha:1.0f]
#define PlACEHOLDER_COLOR [UIColor colorWithRed:94.0f/255.f green:179.0f/255.f blue:188.0f/255.f alpha:0.1f]

@interface DesignVC () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *pagesBtn;
@property (weak, nonatomic) IBOutlet UIButton *followersBtn;
@property (weak, nonatomic) IBOutlet UIView *btnsView;
@property (weak, nonatomic) IBOutlet UIView *placeholderView;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;

@end

@implementation DesignVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.photoImageView.layer.borderWidth = 1.f;
    self.photoImageView.layer.masksToBounds = YES;
    
    [self.followBtn setBackgroundColor:BTNS_COLOR];
    
    self.shareButton.layer.borderColor = BTNS_COLOR.CGColor;
    self.shareButton.layer.borderWidth = 2.f;
    self.shareButton.layer.masksToBounds = YES;
    
    [self.placeholderView setBackgroundColor:PlACEHOLDER_COLOR];
    
    [self.photosCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageCVCell class]) bundle:nil] forCellWithReuseIdentifier:IMAGE_CV_CELL_IDENTIFIER];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.photoImageView.layer.cornerRadius = self.photoImageView.bounds.size.height / 2;
        self.followBtn.layer.cornerRadius = self.followBtn.bounds.size.height / 2;
        self.shareButton.layer.cornerRadius = self.followBtn.bounds.size.height / 2;
    });
}

#pragma mark - UICollectionView datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IMAGE_CV_CELL_IDENTIFIER forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.photosCollectionView.bounds.size.width / 4, self.photosCollectionView.bounds.size.width / 4);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}



@end
