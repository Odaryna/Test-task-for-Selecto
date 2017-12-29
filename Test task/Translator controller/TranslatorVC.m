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
    NSMutableArray *_historyArray;
}

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UILabel *firstLanguageLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLanguageLabel;

- (IBAction)changeLanguage:(UIButton *)sender;
- (IBAction)showHistory:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *historyTableView;
@property (weak, nonatomic) IBOutlet UIButton *historyBtn;
@property (weak, nonatomic) IBOutlet UIButton *languageBtn;

@end

@implementation TranslatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTextField.text = @"";
    self.secondTextField.text = @"";
    
    _translatedDictionary = [UserDefaultsManager translatedWords];
    _historyArray = [NSMutableArray new];
}

- (IBAction)changeLanguage:(UIButton *)sender {
    
    _translationFromUkrainian = !_translationFromUkrainian;
    [self changeDataLabels];
}

- (IBAction)showHistory:(UIButton *)sender {
    
    [_historyArray removeAllObjects];
    for (TranslationModel *translation in [[CoreDataManager sharedManager] getAllTranslations]) {
        if (translation.fromEnglish) {
            [_historyArray addObject:[NSString stringWithFormat:@"%@ - %@", translation.englishText, translation.ukrainianText]];
        } else {
            [_historyArray addObject:[NSString stringWithFormat:@"%@ - %@", translation.ukrainianText, translation.englishText]];
        }
    }
    [self.historyTableView reloadData];
}

#pragma mark - UITextView delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self translate];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - private methods

- (void)translate {
    
    NSString *textToTranslate = [self.firstTextField.text lowercaseString];
    self.secondTextField.text = _translationFromUkrainian ? [[_translatedDictionary allKeysForObject:textToTranslate] objectAtIndex:0] : [_translatedDictionary objectForKey:textToTranslate];
    
    if (self.secondTextField.text.length > 0) {
        
        [[CoreDataManager sharedManager] saveTranslation:[ [TranslationModel alloc] initWithEnglishText:[self englishText] ukrainianText:[self ukrainianText] fromEnglish:!_translationFromUkrainian]];
    }
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [_historyArray objectAtIndex:indexPath.row];;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _historyArray.count;
}



@end
