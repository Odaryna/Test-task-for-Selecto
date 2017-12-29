//
//  ImageVC.m
//  Test task
//
//  Created by Odaryna on 12/27/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "ImageVC.h"
#import "ImageCVCell.h"
#import "UIImage+animatedGIF.h"

dispatch_queue_t backgroundQueue() {
    static dispatch_once_t queueCreationGuard;
    static dispatch_queue_t queue;
    dispatch_once(&queueCreationGuard, ^{
        queue = dispatch_queue_create("com.test_task.GIF.backgroundQueue", 0);
    });
    return queue;
}


@interface ImageVC () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *gifCollectionView;

@end

@implementation ImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.gifCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageCVCell class]) bundle:nil] forCellWithReuseIdentifier:IMAGE_CV_CELL_IDENTIFIER];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.gifCollectionView.bounds.size.width / 4, self.gifCollectionView.bounds.size.width / 4);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IMAGE_CV_CELL_IDENTIFIER forIndexPath:indexPath];

    dispatch_async(backgroundQueue(), ^{
        
        UIImage *animatedGIFImage = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/c/c0/An_example_animation_made_with_Pivot.gif"]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [cell setImage:animatedGIFImage];
        });
    });

    return cell;
}


@end
