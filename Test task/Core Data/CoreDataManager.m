//
//  CoreDataManager.m
//  Test task
//
//  Created by Odaryna on 12/29/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "CoreDataManager.h"
#import "TranslatedText+CoreDataProperties.h"

@implementation CoreDataManager

@synthesize persistentContainer = _persistentContainer;

+ (instancetype)sharedManager {
    static CoreDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CoreDataManager alloc] init];
    });
    return _sharedManager;
}

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Test_task"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - public methods

- (void)saveTranslation:(TranslationModel *)model {
    
    TranslatedText *dbTranslatedText = [NSEntityDescription insertNewObjectForEntityForName:@"TranslatedText" inManagedObjectContext:[self persistentContainer].viewContext];
    [dbTranslatedText setEnglish:model.englishText];
    [dbTranslatedText setUkrainian:model.ukrainianText];
    [dbTranslatedText setFrom_english:model.fromEnglish];
    
    [self saveContext];
}

- (NSArray<TranslationModel *> *)getAllTranslations {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TranslatedText"];
    NSError *error = nil;
    NSArray *results = [[self persistentContainer].viewContext executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        return nil;
    }
    
    NSMutableArray *translations = [NSMutableArray new];
    for (TranslatedText *dbText in results) {
        [translations addObject:[[TranslationModel alloc] initWithEnglishText:dbText.english ukrainianText:dbText.ukrainian fromEnglish:dbText.from_english]];
    }
    
    return [translations copy];
}

@end
