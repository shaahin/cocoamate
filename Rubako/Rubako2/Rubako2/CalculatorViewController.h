//
//  CalculatorViewController.h
//  Rubako2
//
//  Created by Shahin Katebi on 10/4/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *resultText;
- (IBAction)digitEntered:(UIButton *)sender;
- (IBAction)operatorClicked:(UIButton *)sender;

- (void) calculateWithOperator: (NSString *)operatorName andValue: (double) value;
- (IBAction)backSpace:(UIButton *)sender;
@end
