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

@property (nonatomic, strong) NSString *billAmount;

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
    
    self.tipAmountLabel.text = [self calculateTip];
}


- (NSString*)calculateTip {
    NSNumber *afterTipBillAmount = @([self.billAmount floatValue] * 1.15);  // add 15% tip
    NSString *afterTipBillAmountString = [[NSString alloc] initWithFormat:@"%@", afterTipBillAmount];
    return afterTipBillAmountString;
}







@end
