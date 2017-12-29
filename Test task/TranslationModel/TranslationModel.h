//
//  TranslationModel.h
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TranslationModel : NSObject

@property (nonatomic, copy) NSString *englishText;
@property (nonatomic, copy) NSString *ukrainianText;
@property (nonatomic, assign) BOOL fromEnglish;

- (instancetype)initWithEnglishText:(NSString *)eText ukrainianText:(NSString *)uText fromEnglish:(BOOL)fromE;

@end
