//
//  TranslationModel.m
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "TranslationModel.h"

@implementation TranslationModel

- (instancetype)initWithEnglishText:(NSString *)eText ukrainianText:(NSString *)uText fromEnglish:(BOOL)fromE {
    if (self = [super init]) {
        _englishText = eText;
        _ukrainianText = uText;
        _fromEnglish = fromE;
    }
    return self;
}

@end
