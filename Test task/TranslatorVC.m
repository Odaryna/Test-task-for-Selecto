//
//  TranslatorVC.m
//  Test task
//
//  Created by Odaryna on 12/27/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

#import "TranslatorVC.h"

@interface TranslatorVC () {
    BOOL _translationFromUkrainian;
}

@property (weak, nonatomic) IBOutlet UITextView *firstTextView;
@property (weak, nonatomic) IBOutlet UITextView *secondTextView;
@property (weak, nonatomic) IBOutlet UILabel *firstLanguageLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLanguageLabel;

- (IBAction)changeLanguage:(UIButton *)sender;

@end

@implementation TranslatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTextView.text = @"";
    self.secondTextView.text = @"";
}

- (IBAction)changeLanguage:(UIButton *)sender {
    
    _translationFromUkrainian = !_translationFromUkrainian;
    [self changeDataLabels];
}

#pragma mark - private methods
- (void)changeDataLabels {
    
    NSString *textFromFirstTextView = @"";
    textFromFirstTextView = self.firstTextView.text;
    self.firstTextView.text = self.secondTextView.text;
    self.secondTextView.text = textFromFirstTextView;
    
    if (_translationFromUkrainian) {
        
        self.firstLanguageLabel.text = @"UKR";
        self.secondLanguageLabel.text = @"ENG";
    } else {
        self.firstLanguageLabel.text = @"ENG";
        self.secondLanguageLabel.text = @"UKR";
    }
}

@end
