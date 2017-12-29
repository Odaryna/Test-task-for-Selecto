//
//  EERoundedButton.h
//  UDBapp
//
//  Created by Odaryna Korolevych on 4/6/17.
//  Copyright © 2017 Daniel Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EERoundedButton : UIButton

@property (nonatomic, assign) IBInspectable float cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@end
