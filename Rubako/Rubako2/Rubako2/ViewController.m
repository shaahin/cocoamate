//
//  ViewController.m
//  Rubako2
//
//  Created by Shahin Katebi on 10/4/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSNumber *number = [NSNumber numberWithDouble:1.4];

    NSArray *array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", number, nil];
    double dbl = [((NSNumber *)[array objectAtIndex:3]) doubleValue];
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    NSMutableArray *arrayCopy = [array mutableCopy];
    array = mutArray;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"test I",@"test II", nil] forKeys:[NSArray arrayWithObjects:@"1",@"2", nil]];
    
    [dict objectForKey:@"2"];
    [dict setObject:@"Iran" forKey:@"2"];
    
    NSString *string = [[NSString alloc] init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"testUser" forKey:@"username"];
    [userDefaults synchronize];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"this is a message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
