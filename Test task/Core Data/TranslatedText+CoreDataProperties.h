//
//  TranslatedText+CoreDataProperties.h
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//
//

#import "TranslatedText+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TranslatedText (CoreDataProperties)

+ (NSFetchRequest<TranslatedText *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *english;
@property (nullable, nonatomic, copy) NSString *ukrainian;
@property (nonatomic) BOOL from_english;

@end

NS_ASSUME_NONNULL_END
