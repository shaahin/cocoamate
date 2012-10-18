//
//  ViewController.m
//  rubakoProject1
//
//  Created by Shahin Katebi on 10/3/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize testLabel = _testLabel;
@synthesize theButton = _theButton;
@synthesize testTextField = _testTextField;
- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabelText:(UIButton *)sender {
       // self.testLabel.text = self.testTextField.text;
}

@end
