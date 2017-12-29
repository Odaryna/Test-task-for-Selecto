//
//  EERoundedButton.m
//  UDBapp
//
//  Created by Odaryna Korolevych on 4/6/17.
//  Copyright © 2017 Daniel Yang. All rights reserved.
//

#import "EERoundedButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation EERoundedButton

- (BOOL)clipsToBounds {
    return YES;
}

- (void)setClipsToBounds:(BOOL)clipsToBounds {
    [super setClipsToBounds:YES];
}

- (void)setCornerRadius:(float)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}


@end
