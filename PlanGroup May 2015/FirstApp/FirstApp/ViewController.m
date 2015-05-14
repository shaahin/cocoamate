//
//  ViewController.m
//  FirstApp
//
//  Created by Shahin on 5/8/15.
//  Copyright (c) 2015 Plan Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *planGroup;



@end

@implementation ViewController

- (NSString *) saveUserWithFirstName:(NSString *) firstName andLastName: (NSString *) lastName
{
    return @"";
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self saveUserWithFirstName:@"Ali" andLastName:@"Jalali"];
}
@end
