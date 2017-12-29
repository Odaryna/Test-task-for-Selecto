//
//  ImageCVCell.m
//  Test task
//
//  Created by Odaryna on 12/27/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "ImageCVCell.h"

@interface ImageCVCell ()

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@end

@implementation ImageCVCell

- (void)setImage:(UIImage *)image {
    self.gifImageView.image = image;
}
@end
