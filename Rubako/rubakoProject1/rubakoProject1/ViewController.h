//
//  ViewController.h
//  rubakoProject1
//
//  Created by Shahin Katebi on 10/3/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UITextField *testTextField;
@property (weak, nonatomic) IBOutlet UIButton *theButton;
- (IBAction)changeLabelText:(UIButton *)sender;
@end
