//
//  CalculatorViewController.m
//  Rubako2
//
//  Created by Shahin Katebi on 10/4/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) double result;
@property (nonatomic) NSString *lastOperator;
@end

@implementation CalculatorViewController
@synthesize result = _result;
@synthesize lastOperator = _lastOperator;

- (NSString *)lastOperator
{
    if(!_lastOperator)
        _lastOperator = @"";
    return _lastOperator;
}
- (double)result
{
   if(!_result)
       _result = 0;
    return _result;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitEntered:(UIButton *)sender {
    NSMutableString *currentString = [self.resultText.text mutableCopy];
    NSString *buttonString = sender.titleLabel.text;
    [currentString appendString:buttonString];
    //currentString = [currentString stringByAppendingString:buttonString];
    self.resultText.text = currentString;
}

- (IBAction)operatorClicked:(UIButton *)sender
{
    NSString *operatorName = sender.titleLabel.text;
    if(![operatorName isEqualToString:@"="])
    {
        if([self.lastOperator isEqualToString:@""])
        {
            self.lastOperator = operatorName;
            self.result = [self.resultText.text doubleValue];
            self.resultText.text = @"";
        }
        else
            [self calculateWithOperator:operatorName andValue:[self.resultText.text doubleValue]];
    } else{
        [self calculateWithOperator:@"" andValue:[self.resultText.text doubleValue]];
        self.resultText.text = [NSString stringWithFormat:@"%f", self.result];
        
    }
}
- (void) calculateWithOperator: (NSString *)operatorName andValue: (double) value
{
    if([self.lastOperator isEqualToString:@"+"])
    {
        self.result += value;
    } else if([self.lastOperator isEqualToString:@"-"])
    {
        self.result -= value;
        
    } else if([self.lastOperator isEqualToString:@"*"])
    {
        self.result *= value;
        
    } else if([self.lastOperator isEqualToString:@"/"])
    {
        self.result /= value;
    }
    self.resultText.text = @"";
    self.lastOperator = operatorName;
}

- (IBAction)backSpace:(UIButton *)sender {
}
@end
