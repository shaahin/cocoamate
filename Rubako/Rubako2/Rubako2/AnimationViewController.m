//
//  AnimationViewController.m
//  Rubako2
//
//  Created by Shahin Katebi on 10/4/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController () <UIAlertViewDelegate>

@end

@implementation AnimationViewController

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

- (void)viewDidUnload {
    [self setTheLabel:nil];
    [super viewDidUnload];
}
- (void) doAnimate
{
    [UIView animateWithDuration:.5f animations:^(void) {
        self.theLabel.alpha -= .1f;
        CGRect rect = self.theLabel.frame;
        rect.origin.y += 15;
        self.theLabel.frame = rect;
        //self.theLabel.transform = CGAffineTransformMakeScale( 5.0, 5.0 );
    } completion:^(BOOL finished) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Continue Animation?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
        [alert show];
    }];
}
- (IBAction)button1:(UIButton *)sender {
    [self doAnimate];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"YES"])
    {
        [self doAnimate];
    }
    else if([buttonTitle isEqualToString:@"NO"])
    {
        [self.tabBarController setSelectedIndex:0];
    }
}

- (IBAction)button2:(UIButton *)sender {
}
@end
