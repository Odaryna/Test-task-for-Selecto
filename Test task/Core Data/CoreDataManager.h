//
//  CoreDataManager.h
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TranslationModel.h"

@interface CoreDataManager : NSObject

+ (instancetype)sharedManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

- (void)saveTranslation:(TranslationModel *)model;
- (NSArray<TranslationModel *> *)getAllTranslations;

@end
