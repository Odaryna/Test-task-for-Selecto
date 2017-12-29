//
//  UserDefaultsManager.m
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "UserDefaultsManager.h"

NSString *const savedTranslatedWords = @"savedTranslatedWords";

@implementation UserDefaultsManager

#pragma mark - NSUserDefaults standard user defaults

+ (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

#pragma mark - Translated words
+ (NSDictionary *)translatedWords {
    NSDictionary *savedTranslatedWordsDict = [[self userDefaults] dictionaryForKey:savedTranslatedWords];
    return savedTranslatedWordsDict ? savedTranslatedWordsDict : [self setWordsForTranslations];
}

#pragma mark - private methods

+ (NSDictionary *)setWordsForTranslations {
    
    NSArray *englishWords = @[@"do", @"make", @"insist on", @"realise", @"decide", @"fear", @"can", @"have", @"have to", @"love", @"like"];
    
    NSArray *ukranianWords = @[@"робити", @"робити", @"наполягати на", @"зрозуміти", @"вирішити", @"боятись", @"могти", @"мати", @"мусити", @"любити", @"подобатись"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    for (NSInteger index = 0; index < englishWords.count; index++) {
        [dictionary setObject:[ukranianWords objectAtIndex:index] forKey:[englishWords objectAtIndex:index]];
    }
    
    [[self userDefaults] setObject:[dictionary copy] forKey:savedTranslatedWords];
    return [dictionary copy];
}


@end
