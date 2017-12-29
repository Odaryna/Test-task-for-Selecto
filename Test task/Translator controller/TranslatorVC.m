//
//  TranslatorVC.m
//  Test task
//
//  Created by Odaryna on 12/27/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "TranslatorVC.h"
#import "CoreDataManager.h"
#import "UserDefaultsManager.h"

@interface TranslatorVC () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource> {
    BOOL _translationFromUkrainian;
    NSDictionary *_translatedDictionary;
}

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UILabel *firstLanguageLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLanguageLabel;

- (IBAction)changeLanguage:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;

@end

@implementation TranslatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTextField.text = @"";
    self.secondTextField.text = @"";
    
    _translatedDictionary = [UserDefaultsManager translatedWords];
}

- (IBAction)changeLanguage:(UIButton *)sender {
    
    _translationFromUkrainian = !_translationFromUkrainian;
    [self changeDataLabels];
}

#pragma mark - UITextView delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self translate];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - private methods

- (void)translate {
    self.secondTextField.text = _translationFromUkrainian ? [[_translatedDictionary allKeysForObject:self.firstTextField.text] objectAtIndex:0] : [_translatedDictionary objectForKey:self.firstTextField.text];
    [[CoreDataManager sharedManager] saveTranslation:[ [TranslationModel alloc] initWithEnglishText:[self englishText] ukrainianText:[self ukrainianText] fromEnglish:_translationFromUkrainian]];
}

- (void)changeDataLabels {
    
    NSString *textFromFirstTextView = @"";
    textFromFirstTextView = self.firstTextField.text;
    self.firstTextField.text = self.secondTextField.text;
    self.secondTextField.text = textFromFirstTextView;
    
    if (_translationFromUkrainian) {
        
        self.firstLanguageLabel.text = @"UKR";
        self.secondLanguageLabel.text = @"ENG";
    } else {
        self.firstLanguageLabel.text = @"ENG";
        self.secondLanguageLabel.text = @"UKR";
    }
}

- (NSString *)englishText {
    return _translationFromUkrainian ? self.secondTextField.text : self.firstTextField.text;
}

- (NSString *)ukrainianText {
    return _translationFromUkrainian ? self.firstTextField.text : self.secondTextField.text;
}

//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    
//    
//}
//
//- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return 0;
//}



@end
