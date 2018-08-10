//
//  ViewController.m
//  TipCalculator
//
//  Created by NICE on 2018-08-10.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@property (nonatomic, strong) NSString *billAmount;
@property (nonatomic, strong) NSString *tipPercentage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextField];


}

- (void)setupTextField {
    self.billAmountTextField.delegate = self;
    self.billAmountTextField.keyboardType = UIKeyboardTypeDefault;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    

}

- (IBAction)calculateTip:(id)sender {
    [self.billAmountTextField resignFirstResponder];
    self.billAmount = self.billAmountTextField.text;
    self.tipPercentage = self.tipPercentageTextField.text;
    self.tipAmountLabel.text = [self calculateTip];
}


- (NSString*)calculateTip {
    NSNumber *tipAmount = @([self.billAmount floatValue] * ([self.tipPercentage floatValue]/100 + 1));
    NSString *tipAmountString = [[NSString alloc] initWithFormat:@"$ %@", tipAmount];
    return tipAmountString;
}







@end
