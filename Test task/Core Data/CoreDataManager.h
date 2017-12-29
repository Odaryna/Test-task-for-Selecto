//
//  CoreDataManager.h
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

+ (instancetype)sharedManager;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
