//
//  TranslatedText+CoreDataProperties.m
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//
//

#import "TranslatedText+CoreDataProperties.h"

@implementation TranslatedText (CoreDataProperties)

+ (NSFetchRequest<TranslatedText *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TranslatedText"];
}

@dynamic english;
@dynamic ukrainian;
@dynamic from_english;

@end
